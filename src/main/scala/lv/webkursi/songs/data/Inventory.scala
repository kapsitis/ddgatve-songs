package lv.webkursi.songs.data
import java.io.File
import lv.webkursi.songs.util.FileUtilities

/**
 * This is used to obtain various useful lists from the song-related files.
 * File content is not analyzed; just the names.
 *
 * <h3>Switch -c</h3>
 * Print out lists of XML files not contained under 'lilypond' directory
 * and vice versa.
 *
 * <h3>Switch -v</h3>
 * Build an xml validation list and store it as 'build.songs.txt'
 *
 */
object Inventory {

  def main(args: Array[String]): Unit = {
    if (args.length < 2) {
      Console.err.println("Usage: Inventory -c <song-directory>")
      Console.err.println("    or Inventory -v <song-directory>")
      System.exit(0)
    }

    val lyDir = new File(args(1) + "/lilypond")
    val allFiles0: List[String] = lyDir.list.toList
    val lyFiles = allFiles0 filter {_.endsWith(".ly")}
    val lySorted = lyFiles.sortWith((x, y) => x.compareTo(y) < 0)
    println(lySorted)
    val lyRoots = lySorted map (_.replaceFirst("\\.ly", ""))

    val xmlDir = new File(args(1) + "/xml")
    val allFiles1: List[String] = xmlDir.list.toList
    val xmlFiles = allFiles1 filter {_.endsWith(".xml")}
    val xmlSorted = xmlFiles.sortWith((x, y) => x.compareTo(y) < 0)
    println(xmlSorted)
    val xmlRoots = xmlSorted map (_.replaceFirst("\\.xml", ""))

    if (args(0).equals("-c")) {
      for (xmlFile <- xmlRoots) {
        if (!lyRoots.contains(xmlFile)) {
          println("File " + xmlFile + ".xml not contained under lilypond")
        }
      }

      for (lyFile <- lyRoots) {
        if (!xmlRoots.contains(lyFile)) {
          println("File " + lyFile + ".ly not contained under xml")
        }
      }
    }
    else if (args(0).equals("-v")) {
      val lst = allFiles1 map {(x) => "<arg value='" + args(1) + "/xml/" + x + "'/>"}
      val validationList = lst.mkString("\n")
      FileUtilities.writeProcedural("build.songs.txt",validationList)
    }

  }

}