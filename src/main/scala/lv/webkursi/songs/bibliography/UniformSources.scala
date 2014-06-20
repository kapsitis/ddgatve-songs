package lv.webkursi.songs.bibliography
import java.io.File
import scala.xml.XML
import java.io.FileInputStream
import scala.xml.Node
import scala.collection.mutable.HashMap
import lv.webkursi.songs.util.FileUtilities

/**
 * This class is necessary to ensure that all the song sources can be found
 * in the bibliography.xml. It may take two steps - standardize (switch -s),
 * and match (switch -m).
 *
 * <h3>Switch "-s"</h3>
 * The "alternative" source strings are
 * standardized in the XML files (e.g. under "songs/xml").
 * E.g. if some song lyrics files refer to f/k-Laiva as "AALapas", then
 * "resources/bibliography.xml" contains "AALapas" along with standardized
 * label "FkLaiva". And during the first pass this utility replaces all
 * "AALapas" into "FkLaiva".
 *
 *
 * <h3>Switch "-m"</h3>
 *
 */
object UniformSources {

  /**
   * 
   */
  def main(args: Array[String]): Unit = {
    if (args.length < 3 || (!args(0).equals("-s") && !args(0).equals("-m"))) {
      Console.err.println("Usage: UniformSources <-s|-m> <bibliography> <dir>")
      Console.err.println("  -s ... standardize sources under dir/xml")
      Console.err.println("  -m ... find and print unmatched sources")
      Console.err.println("  <bibliography> - XML file with bibitems")
      Console.err.println("  <dir> - should have 'xml' subdirectory with song lyrics")
      System.exit(0)
    }

    val idMap = BibliographyFile.getIdMap(args(1))

    val xmlDir = new File(args(2) + "/xml")
    val xmlFiles: List[String] = xmlDir.list.toList
    val xmlSorted = xmlFiles.sortWith((x, y) => x.compareTo(y) < 0)
    println(xmlSorted)

    if (args(0).equals("-s")) {
      xmlSorted foreach { fName =>
        {
          val fCont = XML.load(new FileInputStream(args(2) + "/xml/" + fName))
          Console.err.println("Processing " + fName)
          val newCont = UpdateXml.updateVersion(fCont, idMap, fName)
          FileUtilities.writeProcedural(args(2) + "/xml1/" + fName, newCont.toString)
        }
      }
    }
    else if (args(0).equals("-m")) {
      xmlSorted foreach { fName =>
        {
          val fCont = XML.load(new FileInputStream(args(2) + "/xml/" + fName))
          val source = (fCont\\"source").head.text
          val nSource = if (source.length == 0) source else source + "|"
          val regex = """^((#?[a-zA-Z0-9 \.]+[a-zA-Z0-9\.]|Katrīna|#Dzīvesziņa5|Budēlīši|#Sūna1966)(,(p\.|#)[0-9]+)?\|)*$""".r
          val m = regex.findFirstIn(nSource)
          m match {
            case Some(x) => {}
            case None => { Console.out.println("did not match '" + nSource + "' in " + fName) } 
          }
        }
      }      
    }

  }

}