package top

import boom.common.{BoomTile, BoomTileParams, WithNSmallBooms}
import chipsalliance.rocketchip.config._
import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util._
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
    boomTileParams.crossingParams,
    boomTileParams.lookup
  ))
  class FakeIntrSource(implicit p: Parameters) extends LazyModule {
    val intSrcNode = IntSourceNode(Seq(IntSourcePortParameters(Seq(IntSourceParameters(
      IntRange(10)
    )))))
    lazy val module = new LazyModuleImp(this) {
      intSrcNode.out.head._1 := 0.U.asTypeOf(intSrcNode.out.head._1)
    }
  }

  val intr = LazyModule(new FakeIntrSource())
  boom.intInwardNode := intr.intSrcNode

  val hart = BundleBridgeSource(() => 0.U)
  boom.hartIdNode := hart

  val resetVec = BundleBridgeSource(() => 0x10000000L.U(soc.PAddrBits.W))
  boom.resetVectorNode := resetVec

  val nmi = BundleBridgeSource(() => new NMI(soc.PAddrBits))
  boom.nmiNode := nmi

  val wfiSink = IntSinkNode(Seq(IntSinkPortParameters(Seq(IntSinkParameters()))))
  wfiSink := boom.wfiNode

  lazy val module = new LazyModuleImp(this){
  }
}

class BoomTop(implicit p: Parameters) extends BaseXSSoc with HaveAXI4MemPort with HaveAXI4PeripheralPort {
  val core = LazyModule(new BoomWrapper())

  // boom send all requests in one node
  val boomMasterXbar = TLXbar()

  boomMasterXbar := core.boom.masterNode
  l3_xbar := boomMasterXbar
  peripheralXbar := TLFragmenter(8, 64, holdFirstDeny = true) := boomMasterXbar

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

  bankedNode :*= l3cache.node :*= TLWidthWidget(8) :*= TLBuffer() :*= l3_xbar

  lazy val module = new BaseXSSocImp(this){

  }
}

class BoomTopConfig extends Config(
  new Config((site, here, up) => {
    case SoCParamsKey =>  // BaseTile require VaddrBits > PaddrBits
      up(SoCParamsKey).copy(PAddrBits = 38)
  }) ++
    new DefaultConfig(1) ++
    new WithNSmallBooms() ++
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
