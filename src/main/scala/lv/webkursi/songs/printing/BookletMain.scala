package lv.webkursi.songs.printing

import java.io.{ File, FileWriter }
import java.io.{ FileOutputStream, OutputStreamWriter, BufferedWriter }
import java.io.FileInputStream
import scala.util.matching.Regex
import scala.xml.XML
import _root_.lv.webkursi.songs.wiki.{ WikiProc, WikiBlockGrammar }
import scala.io.Source
import lv.webkursi.songs.util.FileUtilities
import scala.xml.NodeSeq
import scala.xml.Node
import lv.webkursi.songs.bibliography.BibReference

/**
 * Utility class - populates "build-book" subdirectory with filtered SVG images and song texts
 *
 */
object BookletMain {
  def main(args: Array[String]): Unit = {
    if (args.size < 1) {
      Console.err.println("Usage: BookletMain <booklet-xml>")
      System.exit(0)
    }

    val svgContent = XML.load(new FileInputStream(args(0)))

    val foreword = (svgContent \\ "foreword").head.text
    val editionNotice = (svgContent \\ "edition-notice").head.text
    val snippetList = List(("foreword", foreword), ("edition-notice", editionNotice))

    snippetList foreach { snippet: (String, String) =>
      {
        Console.println("PARSING " + snippet._2.trim.subSequence(0,Math.min(100,snippet._2.trim.length())))
        val snippetTree = WikiBlockGrammar.parse(snippet._2.trim)
        Console.println("PARSING SUCCESS")
        val snippetResult = <html>
                              <head><title>
                                      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                                    </title></head>
                              <body>{ WikiProc.eval(snippetTree) }</body>
                            </html>
        FileUtilities.writeProcedural("build-book/" + snippet._1 + ".html", snippetResult.toString)
      }
    }
    val songElts = svgContent \\ "section" \\ "song"
    val songLocs = songElts map { elt => ((elt \\ "@dir").text, (elt \\ "@id").text) }

    songLocs foreach { (songL) => transformFont(songL._1, songL._2) }
    songLocs foreach { (songL) => processWords(songL._1, songL._2) }
  }

  def transformFont(songDir: String, songId: String): Unit = {
    TransformSvgFont.transform(songDir + "/svg/" + songId + ".svg", "build-book/svg/" + songId + ".svg")
  }

  def processWords(songDir: String, songId: String): Unit = {
    Console.err.println("Words for: " + songId)
    val xmlContent = XML.load(new FileInputStream(songDir + "/xml/" + songId + ".xml"))
    val lyrics = xmlContent \\ "lyrics"
    val songTitle = xmlContent \\ "title"
    val songNarrator = xmlContent \\ "narrator"
    val songSources: NodeSeq = xmlContent \\ "sources"
    val songGenre = xmlContent \\ "genre"
    val songGenreNote = (xmlContent \\ "genre").head.attribute("note")
    val songGenreNoteStr: String = songGenreNote match {
      case Some(x) => x.text
      case _ => ""
    }
    val songMode = xmlContent \\ "mode"
    val songKeys = xmlContent \\ "keys"
    val newlyrics = lyrics.text
    val result = WikiBlockGrammar.parse(newlyrics.trim)
    val htmlResult = <html>
                       <head><title>{ songTitle.text }</title></head>
                       <body>
                         <div class='narrator'>{ songNarrator.text.trim }</div>
                         <div class='sources'>{ BibReference.xmlToHtml(songSources) }</div>
                         <div class='genre'>{ songGenre.text.trim }</div>
                         <div class='genrenote'>{ songGenreNoteStr }</div>
                         <div class='mode'>{ songMode.text.trim }</div>
                         <div class='keys'>{ songKeys }</div>
                         <div class='content'>{ WikiProc.eval(result) }</div>
                       </body>
                     </html>

    FileUtilities.writeProcedural("build-book/xml/" + songId + ".xml", htmlResult.toString)

  }

}