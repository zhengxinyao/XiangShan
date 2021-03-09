package cache

class TransTimer(timeout: Int = 1000) {
  private var timer = 0
  private var timerRunning = false

  def start(): Unit = {
    timer = 0
    timerRunning = true
  }

  def reset(): Unit = {
    timer = 0
    timerRunning = false
  }

  def step(): Boolean = {
    if (timerRunning) {
      timer += 1
      timer >= timeout
    }
    else {
      false
    }
  }

  def isTimeout(): Boolean = {
    timerRunning && (timer >= timeout)
  }
}
