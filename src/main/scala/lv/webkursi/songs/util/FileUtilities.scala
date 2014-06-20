package lv.webkursi.songs.util
import java.io.FileOutputStream
import java.io.OutputStreamWriter
import java.io.BufferedWriter
import java.io.FileWriter

object FileUtilities {
  def writeProcedural(file: String, text: String): Unit = {
    val fos = new FileOutputStream(file)
    val osw = new OutputStreamWriter(fos, "UTF-8")
    val bw = new BufferedWriter(osw)

    try {
      bw.write(text)
    } finally {
      bw.close
      osw.close
      fos.close
    }
  }

  def write(file: String, text: String): Unit = {
    val fw = new FileWriter(file)
    try { fw.write(text) } finally { fw.close }
  }

}