package lv.webkursi.songs.printing
import scala.io.Source
import java.io.File
import scala.xml.XML
import java.io.FileInputStream

/**
 * Extract motives from LY files and copy them to the XML files
 * (update existing motive element, if it exists).
 * Motives are transposed to c-major or a-minor.
 *
 */
object ExtractMotives {
  def main(args: Array[String]): Unit = {
    if (args.length < 1) {
      Console.err.println("Usage: ExtractMotives <booklet-xml>")
    }

    //    val lyDir = new File(args(0) + "/lilypond")
    //    val allFiles0: List[String] = lyDir.list.toList
    //    val lyFiles = allFiles0 filter { _.endsWith(".ly") }
    //    val lySorted = lyFiles.sortWith((x, y) => x.compareTo(y) < 0)

    val bookletContent = XML.load(new FileInputStream(args(0)))
    val songElts = bookletContent \\ "section" \\ "song"
    val songLocs = songElts map { elt => ((elt \\ "@dir").text, (elt \\ "@id").text) }

    for (fName <- songLocs) {
      Console.err.println("******* Processing " + fName + " **********")
      val lines: List[String] =
        Source.fromFile(new File(fName._1 + "/lilypond/" + fName._2 + ".ly")).getLines().toList
      val trimmedLines = lines map { _.trim() }
      val start = lines.indexOf("%MS")
      val end = lines.indexOf("%ME")
      if (start > -1 && end > -1) {
        val motiveLines = trimmedLines.slice(start, end)
        Console.err.println(motiveLines)
      }
    }
  }
}