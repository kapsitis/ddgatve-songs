package lv.webkursi.songs.lilypond
import scala.xml.Node

import java.io.FileInputStream

import scala.xml.XML

import java.io.File

/**
 * Utility class to print "build.songs.txt" for mass lilypond compilation
 *
 */
object SongListForBuild {

  def main(args: Array[String]): Unit = {

    val longList = if (args.length == 0) {
      val lyDir = new File("songs/lilypond")
      val fileNames = lyDir.list().toList
      val lyFileNamesExt = fileNames filter ((x) => x.endsWith(".ly"))
      val lyfs = lyFileNamesExt map { x => x.substring(0, x.length - 3) }
      (lyfs.head /: lyfs.tail)(_ + ",\n" + _)
    } else {
      val bookContent = XML.load(new FileInputStream(args(0)))

      val songs = bookContent \\ "song"
      val lyfs = songs map ((x:Node) => {
    	  val att = x.attribute("id")
    	  att match {
    	 	  case Some(y) => y.toString
    	 	  case None => ""
    	  }
      })
      (lyfs.head /: lyfs.tail)(_ + ",\n" + _)
    }

    val out = new java.io.FileWriter("songs/lilypond/build.songs.txt")
    out.write("<foreach list=\"" + longList + "\" delimiter=\",\" trim=\"true\" target=\"make\" param=\"song\">\n" +
      "</foreach>")
    out.close()
  }

}