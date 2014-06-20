package lv.webkursi.songs.data
import scala.collection.mutable.ArrayStack

import java.io.FileWriter

import scala.xml.Node

import java.io.File

import scala.io.Source

/**
 * This object extracts songs along with their meta-information
 * from the http://www.ante.lv/xwiki/bin/view/NotisIP/Latgalian song repository
 */
object NotesIpWordsFromFile {

  def main(args: Array[String]): Unit = {
    val lines: List[String] = Source.fromFile(new File("resources/vuordi.txt")).getLines().toList

    var a: ArrayStack[String] = new ArrayStack()
    val sublists: List[List[String]] = for (
      line <- lines;

      val sublist = if (line.trim.length == 0) {
        val reversed = a.toList
        a = new ArrayStack()
        reversed.reverse
      } else {
        a.push(line)
        List()
      }
    ) yield sublist
    
    val filteredLists = sublists filter(_.size > 0)
    //filteredLists map (println(_))
    for (songList <- filteredLists) {
    	val pageNum = songList.head
    	val pageNum2 = "p." + pageNum.replaceAll("\\. ?lpp\\.", "")
    	val remainder = songList.tail
    	val title = remainder.head.replaceAll("[0-9]+", "").trim
    	val songLyrics = remainder.tail.foldLeft("")(_+"\n"+_).replaceAll("1. ", "# ").trim
     val template = <song>
<title>{ title }</title>
<source>Igauni1993,{pageNum2}</source>
<tags>latgalian</tags>
<narrator></narrator>
<musicBy>anon</musicBy>
<lyricsBy>anon</lyricsBy>
<genre>1B</genre>
<ref></ref>
<lyrics>{songLyrics}</lyrics>
</song>   	
    write("resources/file-lyrics/" + camelScript(title) + ".xml",template.toString)

    }
  }

  def write(file: String, text: String): Unit = {
    val fw = new FileWriter(file)
    try { fw.write(text) } finally { fw.close }
  }

  /**
   * Convert song title into pure ASCII camel-script. E.g. the song titled
   * "Aiz šņukura es uzkāpu" becomes "AizShn-ukuraEsUzka-pu"
   */
  def camelScript(arg: String): String = {
    val rep0 = List(("Ā", "A-"), ("Č", "Ch"), ("Ē", "E-"),
      ("Ģ", "G-"), ("Ī", "I-"), ("Ķ", "K-"), ("Ļ", "L-"),
      ("Ņ", "N-"), ("Ō", "O-"), ("Ŗ", "R-"), ("Š", "Sh"), ("Ū", "U-"), ("Ž", "Zh"))
    val rep = rep0 ::: (rep0 map { x => (x._1.toLowerCase, x._2.toLowerCase) })

    val arg2 = arg.replaceAll("\\(", "")
    val arg3 = arg2.replaceAll("\\)", "")
    val arg4 = arg3.replaceAll(",", "")
    val a: Array[String] = arg4.split(" +")
    val trimmed = a map (_.trim)
    val capitalized = trimmed map (word => word.charAt(0).toTitleCase + word.substring(1))
    val nonempty = capitalized filter (_.length > 0)
    var s: String = nonempty.foldLeft("")(_ + _)
    for ((x, y) <- rep) {
      s = s.replaceAll(x, y)
    }
    s
  }
}