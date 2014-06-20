package lv.webkursi.songs.data

import java.io.File
import scala.io.Source

/**
 * This object lists all XML files containing not expected
 * comments within XML source files
 */
object InventoryComments {
  def main(args: Array[String]): Unit = {
    val xmlDir = new File("songs/xml")
    val allFiles1: List[String] = xmlDir.list.toList
    val xmlFiles = allFiles1 filter { _.endsWith(".xml") }
    val xmlSorted = xmlFiles.sortWith((x, y) => x.compareTo(y) < 0)

    for (fName <- xmlSorted) {
      val lines: List[String] =
        Source.fromFile(new File("songs/xml/" + fName)).getLines().toList
      val comments = lines filter { x => x.contains("<!--") && 
        !x.contains("<!--<source label=''/>-->") &&
        !x.contains("<!-- Primary source -->")}
      if (comments.length != 0) {
        System.err.println("File '" + fName + "' contains comments")
      }
    }
  }

}