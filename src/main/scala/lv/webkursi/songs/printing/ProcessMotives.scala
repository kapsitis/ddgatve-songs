package lv.webkursi.songs.printing

import java.io.File

import java.io.FileWriter

import java.io.{ FileOutputStream, OutputStreamWriter, BufferedWriter }
import scala.xml.XML
import java.io.FileInputStream
import scala.util.matching.Regex

import scala.io.Source

/**
 * Utility to create motives as lilypond files - in the specified output directory
 * in its subdirectory "lilypond". Also output an XML file in that same
 * output directory.
 */
object ProcessMotives {

  def main(args: Array[String]): Unit = {
    if (args.size < 2) {
      Console.err.println("Usage: ProcessMotives <booklet-xml> <output-directory>")
      System.exit(0)
    }

    val svgContent = XML.load(new FileInputStream(args(0)))
    val baseDir = (svgContent \\ "book" \\ "@basedir").head.text
    val outDir = args(1)

    val songIdSeq = svgContent \\ "section" \\ "song" \\ "@id";
    val songIdNum = svgContent \\ "section" \\ "song" \\ "@num";

    //    val songIds = (songIdSeq.toList map (_.text)).zip(1.to(songIdSeq.length))
    val songIds = (songIdSeq.toList map (_.text)).zip(songIdNum.toList map (_.text.toInt))
    val allMotivesListList = songIds map { (songId) => insertMotives(songId, baseDir) }
    val allMotivesList = allMotivesListList.flatten
    allMotivesList foreach { (m: Motive) => prepareLilypond(m, outDir) }
    val sortedMotives = allMotivesList.sortWith(Motive.lt)
    Console.err.println("=== Sorted ===")
    val sortedFirstSounds = sortedMotives map { m => m.getMelody()(0).toUpperCase }
    val numberedFirstSounds = (0 until sortedMotives.length) map { i =>
      sortedFirstSounds.slice(0, i).count(s => (s == sortedFirstSounds(i))) + 1
    }
    val codedFirstSounds = sortedFirstSounds.zip(numberedFirstSounds)
    val numSortedMotives = sortedMotives.zip(codedFirstSounds map { pair => pair._1 + pair._2 })
    numSortedMotives foreach { m => println("" + m._2 + ": " + m._1) }
  }

  def insertMotives(sid: (String, Int), baseDir: String): List[Motive] = {
    Console.err.println("Processing " + sid._1)
    val xmlContent = XML.load(new FileInputStream(baseDir + "/xml/" + sid._1 + ".xml"))
    val motive = (xmlContent \\ "motive").head.text.split(" ").toList
    val motiveAdd = (xmlContent \\ "motive").head.attribute("add")
    val added: List[Int] = motiveAdd match {
      case Some(x) => x.head.text.split(",").toList map (_.toInt)
      case _ => List()
    }
    val shifts = 0 :: added
    val allMotives = shifts map { (i) =>
      i match {
        case 0 => new Motive(sid._1, sid._2, motive, 0)
        case 5 => new Motive(sid._1, sid._2, Motive.transposeByFourth(motive), 5)
        case 7 => new Motive(sid._1, sid._2, Motive.transposeByFifth(motive), 7)
      }
    }
    Console.err.println("Found " + allMotives)
    allMotives
  }

  def prepareLilypond(m: Motive, outDir: String): Unit = {
    Console.err.println("Saving to file " + m)
    val fileName = outDir + "/lilypond/" + m.getSongId + "_" + m.getTrans + ".ly"
    Console.err.println("    to file " + fileName)
    writeProcedural(fileName, m.getLilypond)
  }

  def write(file: String, text: String): Unit = {
    val fw = new FileWriter(file)
    try { fw.write(text) } finally { fw.close }
  }

  def writeProcedural(file: String, text: String): Unit = {
    val fos = new FileOutputStream(file)
    val osw = new OutputStreamWriter(fos, "UTF-8")
    val bw = new BufferedWriter(osw)
    val lines = text.split("\n")
    try {
      lines foreach { line => { bw.write(line); bw.write('\n') } }
    } finally {
      bw.close
      osw.close
      fos.close
    }
  }
}

