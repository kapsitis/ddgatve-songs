package lv.webkursi.songs.lilypond

class Env(working: String) {
  private val workDir = new java.io.File(working)
  def run(cmd: String*) = if (Runtime.getRuntime().
    exec(cmd.toArray[String], null, workDir).waitFor() != 0)
    throw new Exception("Execution failed")
}