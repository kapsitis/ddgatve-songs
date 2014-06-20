package lv.webkursi.songs.lilypond
import java.io.{ File, FileInputStream, FileOutputStream }
object FileUtils {

  def move(source: String, destination: String): Unit = {

    val src = new File(source)
    val dest = new File(destination)
    if (src.exists) {
      new FileOutputStream(dest) getChannel () transferFrom (new FileInputStream(src) getChannel, 0, Long.MaxValue)
    }
  }
}