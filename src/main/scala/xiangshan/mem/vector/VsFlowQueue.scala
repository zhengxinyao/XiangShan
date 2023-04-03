
package xiangshan.mem

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import utils._
import utility._
import xiangshan._

class VsFlowPtr(implicit p: Parameters) extends CircularQueuePtr[VsFlowPtr](
  p => p(XSCoreParamsKey).VsFlowSize
){
}

object VsFlowPtr {
  def apply(f: Bool, v: UInt)(implicit p: Parameters): VsFlowPtr = {
    val ptr = Wire(new VsFlowPtr)
    ptr.flag := f
    ptr.value := v
    ptr
  }
}


class VsFlowQueue(implicit p: Parameters) extends XSModule with HasCircularQueuePtrHelper
{

}
