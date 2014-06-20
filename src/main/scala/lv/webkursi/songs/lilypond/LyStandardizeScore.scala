package lv.webkursi.songs.lilypond
import java.io.File
import java.io.FileWriter
import scala.io.Source

/**
 * Replaces in the score section "songs.ante.lv" by "__"
 */
object LyStandardizeScore {
  def main(args: Array[String]): Unit = {
    val lyDir = new File("songs/lilypond")
    val fileNames = lyDir.list().toList
    val lyFileNames = fileNames filter ((x) => x.endsWith(".ly"))
    for (lyFileName <- lyFileNames) {
      Console.err.println("Processing " + lyFileName)
      val lines = Source.fromFile("songs/lilypond/" + lyFileName, "utf-8").getLines
      val out = new java.io.FileWriter("songs/lilypond1/" + lyFileName)
      val found = (false /: lines)(_ | outputLine(out, _))
      out.close
      if (!found) {
        Console.err.println("WARNING: File " + lyFileName + " not transformed")
      }
    }
  }

  def outputLine(out: java.io.FileWriter, line: String): Boolean = {
    if (line.matches("""^\\markup.*"(aaa|dziesmas.ante.lv)" *}""")) {
      out.write("""\markup { \with-color #(x11-color 'white) \sans \smaller "__" }""")
      out.write("\r\n")
      true
    } else {
      out.write(line + "\r\n")
      false
    }
  }

}