package top

import boom.common._
import chipsalliance.rocketchip.config._
import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util._
import device.{AXI4Plic, TLTimer}
import freechips.rocketchip.amba.axi4._
import utils._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.interrupts._
import freechips.rocketchip.rocket.PgLevels
import freechips.rocketchip.subsystem._
import freechips.rocketchip.tile._
import freechips.rocketchip.tilelink._
import sifive.blocks.inclusivecache.{CacheParameters, InclusiveCache, InclusiveCacheMicroParameters}
import system.{HasSoCParameter, SoCParamsKey}

class BoomWrapper(implicit p: Parameters) extends LazyModule with BindingScope with HasSoCParameter {
  val boomTileParams = p(TilesLocated(InSubsystem)).head
  val boom = LazyModule(new BoomTile(
    boomTileParams.tileParams.asInstanceOf[BoomTileParams],
  //val boom = LazyModule(new RocketTile(
  //  boomTileParams.tileParams.asInstanceOf[RocketTileParams],
    boomTileParams.crossingParams,
    boomTileParams.lookup
  ))

  val hart = BundleBridgeSource(() => 0.U)
  boom.hartIdNode := hart

  val resetVec = BundleBridgeSource[UInt]()
  boom.resetVectorNode := resetVec
  InModuleBody {
    resetVec.bundle := 0x80000000L.U(soc.PAddrBits.W)
  }

  val nmi = BundleBridgeSource(() => new NMI(soc.PAddrBits))
  boom.nmiNode := nmi

  val wfiSink = IntSinkNode(Seq(IntSinkPortParameters(Seq(IntSinkParameters()))))
  wfiSink := boom.wfiNode

  lazy val module = new LazyModuleImp(this){
  }
}

class BoomTop(implicit p: Parameters) extends BaseXSSoc with HaveAXI4MemPort with HaveAXI4PeripheralPort {
  val core = LazyModule(new BoomWrapper())
  val cacheBeatBytes = p(SystemBusKey).beatBytes

  // boom send all requests in one node
  val boomMasterXbar = TLXbar()

  boomMasterXbar := core.boom.masterNode
  l3_xbar := boomMasterXbar

  peripheralXbar := TLFragmenter(8, 64, holdFirstDeny = true) := TLWidthWidget(cacheBeatBytes) := boomMasterXbar


  val clint = LazyModule(new TLTimer(
    Seq(AddressSet(0x38000000L, 0x0000ffffL)),
    sim = !debugOpts.FPGAPlatform, NumCores
  ))
  clint.node := TLFragmenter(8, 64, holdFirstDeny = true) := TLWidthWidget(cacheBeatBytes) := boomMasterXbar

  val plic = LazyModule(new AXI4Plic(
    Seq(AddressSet(0x3c000000L, 0x03ffffffL)),
    NumCores, NrExtIntr,
    !debugOpts.FPGAPlatform,
  ))
  plic.node := AXI4IdentityNode() := AXI4UserYanker() := TLToAXI4() :=
    TLFragmenter(8, 64, holdFirstDeny = true) := TLWidthWidget(cacheBeatBytes) := boomMasterXbar

  val intSrcNode = IntSourceNode(Seq(IntSourcePortParameters(Seq(IntSourceParameters(
      IntRange(5)
    )))))
  core.boom.intInwardNode := intSrcNode
  InModuleBody {
    intSrcNode.out.head._1(0) := false.B // debug interrupt
    intSrcNode.out.head._1(1) := clint.module.io.msip(0)
    intSrcNode.out.head._1(2) := clint.module.io.mtip(0)
    intSrcNode.out.head._1(3) := plic.module.io.extra.get.meip(0)
    intSrcNode.out.head._1(4) := plic.module.io.extra.get.meip(0)
  }

  val hasL3 = false

  if (hasL3) {
    val l3cache = LazyModule(new InclusiveCache(
      CacheParameters(
        level = 3,
        ways = L3NWays,
        sets = L3NSets,
        blockBytes = L3BlockSize,
        beatBytes = L3InnerBusWidth / 8,
        cacheName = "L3",
        uncachedGet = false,
        enablePerf = false
      ),
      InclusiveCacheMicroParameters(
        memCycles = 25,
        writeBytes = 32
      ),
      fpga = debugOpts.FPGAPlatform
    ))
    mem_xbar :=* TLBuffer() :=* TLCacheCork() :=* BankBinder(L3NBanks, L3BlockSize) :*=
      l3cache.node :*= TLWidthWidget(cacheBeatBytes) :*= TLBuffer() :*= l3_xbar
  } else {
    mem_xbar :*= TLBroadcast(64) :*= TLWidthWidget(cacheBeatBytes) :*= l3_xbar
  }

  lazy val module = new BaseXSSocImp(this){
    childClock := io.clock.asClock()

    withClockAndReset(childClock, io.reset) {
      plic.module.io.extra.get.intrVec <> io.extIntrs

      val core_reset_gen = Module(new ResetGen(1, !debugOpts.FPGAPlatform))
      core_reset_gen.suggestName(s"core_reset_gen")
      core.module.reset := core_reset_gen.io.out

      val resetGen = Module(new ResetGen(1, !debugOpts.FPGAPlatform))
      resetGen.suggestName("top_reset_gen")
      childReset := resetGen.io.out
    }
  }
}

class BoomSoCConfig extends Config((site, here, up) => {
  case SoCParamsKey => up(SoCParamsKey).copy(extIntrs = 1)
})

class BoomTopConfig extends Config(
    new BoomSoCConfig ++
    new DefaultConfig(1) ++
    //new WithNBigCores(1) ++
    new WithNSmallBooms() ++
    //new WithNLargeBooms() ++
    //new WithNMegaBooms() ++
    new BaseSubsystemConfig
)

object BoomTop extends App {
  override def main(args: Array[String]): Unit = {
    implicit val config = new BoomTopConfig
    val boomTop = LazyModule(new BoomTop())
    (new ChiselStage).execute(args, Seq(
      ChiselGeneratorAnnotation(() => boomTop.module)
    ))
  }
}
