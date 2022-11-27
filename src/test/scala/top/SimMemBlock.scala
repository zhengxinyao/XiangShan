// /***************************************************************************************
// * Copyright (c) 2020-2021 Institute of Computing Technology, Chinese Academy of Sciences
// * Copyright (c) 2020-2021 Peng Cheng Laboratory
// *
// * XiangShan is licensed under Mulan PSL v2.
// * You can use this software according to the terms and conditions of the Mulan PSL v2.
// * You may obtain a copy of Mulan PSL v2 at:
// *          http://license.coscl.org.cn/MulanPSL2
// *
// * THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
// * EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
// * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
// *
// * See the Mulan PSL v2 for more details.
// ***************************************************************************************/

// package top

// import chipsalliance.rocketchip.config.{Config, Parameters}
// import chisel3.stage.ChiselGeneratorAnnotation
// import chisel3._
// import device.{AXI4RAMWrapper, SimJTAG}
// import freechips.rocketchip.diplomacy.{DisableMonitors, LazyModule, LazyModuleImp}
// import utils._
// import xiangshan.{DebugOptions, DebugOptionsKey, XSCoreParamsKey, XSTileKey}
// import xiangshan.mem._
// import chipsalliance.rocketchip.config._
// import freechips.rocketchip.devices.debug._
// import difftest._
// import freechips.rocketchip.util.ElaborationArtefacts
// import top.TopMain.writeOutputFile

// class SimMemBlock(implicit p: Parameters) extends Module {
//   // val l_memblock = LazyModule(new LoadQueue()(p.alter((site, here, up) => {
//   //   case XSCoreParamsKey => up(XSTileKey).head
//   // })))
//   // val memblock = Module(l_memblock.module)
//   val debugOpts = p(DebugOptionsKey)

//   val loadqueue = Module(new LoadQueue()(p.alter((site, here, up) => {
//     case XSCoreParamsKey => up(XSTileKey).head.copy(LoadQueueSize = 16)
//   })))

//   val io = IO(new Bundle(){
//     val logCtrl = new LogCtrlIO
//     val perfInfo = new PerfInfoIO
//     val out = new LoadQueueIOBundle()(p.alter((site, here, up) => {
//       case XSCoreParamsKey => up(XSTileKey).head.copy(LoadQueueSize = 16)
//   }))
//     val perf = Output(Vec(loadqueue.perfEvents.length, new PerfEvent))
//   })

//   loadqueue.io <> io.out
//   // dontTouch(loadqueue.io_perf)
//   loadqueue.io_perf <> io.perf
//   loadqueue.reset := reset
//   loadqueue.clock := clock

//   dontTouch(loadqueue.io.tlbReplayDelayCycleCtrl)

//   val tlbReplayDelayCycleCtrl = VecInit(Seq(11.U(6.W), 50.U(6.W), 30.U(6.W), 10.U(6.W)))

//   loadqueue.io.tlbReplayDelayCycleCtrl := tlbReplayDelayCycleCtrl


//   if (!debugOpts.FPGAPlatform && (debugOpts.EnableDebug || debugOpts.EnablePerfDebug)) {
//     val timer = GTimer()
//     val logEnable = (timer >= io.logCtrl.log_begin) && (timer < io.logCtrl.log_end)
//     ExcitingUtils.addSource(logEnable, "DISPLAY_LOG_ENABLE")
//     ExcitingUtils.addSource(timer, "logTimestamp")
//   }

//   if (!debugOpts.FPGAPlatform && debugOpts.EnablePerfDebug) {
//     val clean = io.perfInfo.clean
//     val dump = io.perfInfo.dump
//     ExcitingUtils.addSource(clean, "XSPERF_CLEAN")
//     ExcitingUtils.addSource(dump, "XSPERF_DUMP")
//   }

//   // Check and dispaly all source and sink connections
//   ExcitingUtils.fixConnections()
//   ExcitingUtils.checkAndDisplay()
// }

// object SimMemBlock extends App {
//   override def main(args: Array[String]): Unit = {
//     // Keep this the same as TopMain except that SimTop is used here instead of XSTop
//     val (config, firrtlOpts) = ArgParser.parse(args)
//     XiangShanStage.execute(firrtlOpts, Seq(
//       ChiselGeneratorAnnotation(() => {
//         DisableMonitors(p => new SimMemBlock()(p))(config)
//       })
//     ))
//     ElaborationArtefacts.files.foreach{ case (extension, contents) =>
//       writeOutputFile("./build", s"LoadQueue.${extension}", contents())
//     }
//   }
// }
