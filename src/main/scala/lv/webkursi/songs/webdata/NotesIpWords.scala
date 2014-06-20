package lv.webkursi.songs.webdata

import java.io.FileWriter

import scala.xml.Node

import java.io.File

import scala.io.Source

/**
 * This object extracts songs along with their meta-information
 * from the http://www.ante.lv/xwiki/bin/view/NotisIP/Latgalian song repository
 */
object NotesIpWords {

  def main(args: Array[String]): Unit = {
    for (line <- Source.fromFile(new File("resources/svetcelojums.txt")).getLines()) {
    	val fName = line.substring(line.lastIndexOf("/")+1)
    	println ("Processing " + fName + "...")
      //if (line.equals("/xwiki/bin/view/NotisIP/Reita-AgriSauleLe-ce")) {
        val root = scala.xml.XML.load("http://www.ante.lv" + line + "?xpage=xml")
        val content = (root \\ "content").head.text.trim
        
        val lyricsStart = content.indexOf("1.")
        val olStart = content.indexOf("/li")
        
//        val title = if (lyricsStart < 0) { 
//        	"" 
//        } else {
//          val songTitle = content.substring(0, lyricsStart)
//          val songTitle1 = songTitle.replaceAll("[0-9]+", "")
//          songTitle1.trim
//        }

        val fullLyrics = if (lyricsStart < 0 && olStart < 0) {
        	content
        } else {          
          val fullLyrics1 = content.replaceAll("</?div>", "");
          val fullLyrics2 = fullLyrics1.replaceAll("</?ol>", "")
          val fullLyrics3 = fullLyrics2.replaceAll("<li>", "# ")
          val fullLyrics4 = fullLyrics3.replaceAll("</li>", "")
          val fullLyrics5 = fullLyrics4.replaceAll("1. ", "# ")
//          val fullLyrics6 = fullLyrics5.replaceAll("""\\""", """\\\n""")
          val fullLyrics7 = fullLyrics5.replaceAll("#  ","# ")
          
          fullLyrics7.replaceAll("\n\n", "\n").trim
        }

        val template = <song>
<title>{ fName }</title>
<source>#TavaPatveruma,#{ fName }</source>
<tags>christian</tags>
<narrator></narrator>
<musicBy>anon</musicBy>
<lyricsBy>anon</lyricsBy>
<genre>1B</genre>
<ref></ref>
<lyrics>{ fullLyrics }</lyrics>
</song>
		write("resources/lyrics/" + fName + ".xml",template.toString)
//        println("template = " + template)

      }
//    }
  }

  def write(file: String, text: String): Unit = {
    val fw = new FileWriter(file)
    try { fw.write(text) } finally { fw.close }
  }

}