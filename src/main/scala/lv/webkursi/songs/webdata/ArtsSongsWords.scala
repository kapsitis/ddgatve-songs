package lv.webkursi.songs.webdata
import java.io.FileWriter

import scala.xml.Node

import java.io.File

import scala.io.Source

/**
 * This object extracts songs along with their meta-information
 * from the Ante.lv Arts.Songs song repository
 */
object ArtsSongsWords {

  def main(args: Array[String]): Unit = {
    for (line <- Source.fromFile(new File("resources/arts.songs.txt")).getLines()) {
    	val fName = line.substring(line.lastIndexOf("/")+1)
    	println ("Processing " + fName + "...")
//      if (line.equals("/xwiki/bin/view/Arts.Songs/AbideWithMe")) {
        val root = scala.xml.XML.load("http://www.ante.lv" + line + "?xpage=xml")
        val fullLyrics = (root \\ "object" \ "property" \ "fullLyrics").head.text
        val songTitle = (root \\ "object" \ "property" \ "title").head.text
        val pairs = (root \\ "object" \ "property") map { (x) => filter(x) }

        val res = for (
          i: Int <- 0 until pairs.size;
          val current = pairs(i) match {
            case List("antemus:tags") => ("tags", pairs(i + 1))
            case List("antemus:source") => ("source", pairs(i + 1))
            case List("antemus:seeAlso") => ("ref", pairs(i + 1))
            case List("antemus:narrator") => ("narrator", pairs(i + 1))
            case List("antemus:genre") => ("genre", pairs(i + 1))
            case List("antemus:variants") => ("ref", pairs(i + 1))
            case _ => ("", List())
          }
        ) yield current

        val res1: List[(String, List[String])] = res.toList
        val fullLyrics1 = fullLyrics.replaceAll("</?div>", "")
        val fullLyrics2 = fullLyrics1.replaceAll("1. ", "# ")
        val fullLyrics3 = fullLyrics2.replaceAll("\n\n", "\n")

        val res2: List[(String, List[String])] = res.toList.filterNot(_._1.equals(""))
        val template = <song>
<title>{ songTitle }</title>
<source>{ consolidateLists("source", res2) }</source>
<tags>{ consolidateLists("tags", res2) }</tags>
<narrator>{ consolidateLists("narrator", res2) }</narrator><musicBy></musicBy><lyricsBy></lyricsBy>
<genre>{ consolidateLists("genre", res2) }</genre>
<ref>{ consolidateLists("ref", res2) }</ref>
<lyrics>{ fullLyrics3 }</lyrics>
</song>
		write("resources/lyrics/" + fName + ".xml",template.toString)
//        println("template = " + template)

//      }
    }
  }

  /**
   * Atfiltrē tos pārus, kuriem pirmā daļa ir label; un pāru otrās puses
   * konkatenē vienā garā sarakstā, atdalot ar "|" simbolu
   */
  def consolidateLists(label: String, lists: List[(String, List[String])]):String = {    val res3 = (lists filter { _._1.equals(label) }) map { _._2 };    val result = if (res3.size == 0) { "" }    else {      res3.reduceLeft(_ ::: _).foldLeft("")(_ + "|" + _)    };    if (result.startsWith("|")) { result.substring(1) } else { result }   }

  /**
   * Atgriež vai nu sarakstu ar vienu elementu, ja tā ir MetaAnte īpašība, vai arī
   * sarakstu ar vērtībām, ja tā ir MetaAnte īpašības vērtība
   */
  def filter(node: Node): List[String] = {
    if ((node \\ "property" \ "value").isEmpty) {
      return List(node.text.trim)
    } else {
      val vals = (node \\ "property" \ "value" \ "value") map { (x) => x.head.text }
      return vals.toList
    }
  }

  def write(file: String, text: String): Unit = {
    val fw = new FileWriter(file)
    try { fw.write(text) } finally { fw.close }
  }

}