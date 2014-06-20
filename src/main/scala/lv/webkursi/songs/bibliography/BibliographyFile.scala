package lv.webkursi.songs.bibliography
import scala.collection.mutable.HashMap
import scala.xml.XML
import java.io.FileInputStream

object BibliographyFile {
  def getIdMap(fName:String):HashMap[String,String] = {
      val bibContent = XML.load(new FileInputStream(fName))
    var bibitems = bibContent \\ "bibitem"
    val idMap = new HashMap[String, String]

    bibitems.foreach { bibitem =>
      idMap += ((bibitem \ "@id").head.text) -> ((bibitem \ "@label").head.text)
      idMap += ((bibitem \ "@label").head.text) -> ((bibitem \ "@label").head.text)
    }
    idMap
  }

}