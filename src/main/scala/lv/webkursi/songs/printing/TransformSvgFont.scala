package lv.webkursi.songs.printing
import java.io.BufferedWriter
import java.io.OutputStreamWriter
import java.io.FileOutputStream
import java.io.FileOutputStream
import java.io.FileOutputStream
import java.io.BufferedReader

import java.io.InputStreamReader

import java.io.FileInputStream

object TransformSvgFont {

  def main(args: Array[String]): Unit = {
    if (args.length < 2) {
      Console.err.println("Usage: TransformSvgFont from to")
      System.exit(0)
    }
    transform(args(0), args(1))
  }

  def transform(from: String, to: String): Unit = {
    Console.err.println("Transforming: " + from)
    val fis = new FileInputStream(from)
    val isr = new InputStreamReader(fis, "UTF-8")
    val br = new BufferedReader(isr)
    val fos = new FileOutputStream(to)
    val osw = new OutputStreamWriter(fos, "UTF-8")
    val bw = new BufferedWriter(osw)
    var line = br.readLine
    while (line != null) {
      val another = line.replaceAll("\"Century Schoolbook L(,serif)?\"", "\"Century Schoolbook\"")
//      val yetAnother = another.replaceAll("\"Century Schoolbook L\"", "\"Century Schoolbook\"")
      bw.write(another)
      bw.write("\r\n")
      line = br.readLine
    }
    bw.close
    osw.close
    fos.close
    br.close
    isr.close
    fis.close
  }
}
