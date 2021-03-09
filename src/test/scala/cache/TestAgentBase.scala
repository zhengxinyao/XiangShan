package cache

import scala.collection.mutable.ListBuffer
import scala.util.Random

class TestAgentBase(ID: Int, name: String = "", start_clock: Int = 0) {
  val rand = new Random(0xdeadbeef+ID)

  var clock = start_clock

  val error_list: ListBuffer[String] = ListBuffer[String]()

  def transStep(): Unit = {
    Unit
  }

  def step(): Unit = {
    transStep()
    clock += 1
  }

  def debugPrefix(): String = {
    f"[DEBUG][time= $clock%19d] TLAgent$ID-$name: "
  }

  def debugPrintln(ins: String): Unit = {
    println(debugPrefix() ++ ins)
  }

  def addAssert(cond: Boolean, message: String): Unit = {
    if (!cond) {
      error_list.append(message)
    }
  }

  def checkAssert(): Unit = {
    if (!error_list.isEmpty) {
      error_list.foreach(debugPrintln(_))
      assert(false, "agent assert!\n")
    }
  }
}
