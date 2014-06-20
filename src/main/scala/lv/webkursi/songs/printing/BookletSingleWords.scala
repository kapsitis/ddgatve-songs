package lv.webkursi.songs.printing

object BookletSingleWords {
  def main(args: Array[String]): Unit = {
    if (args.size < 2) {
      Console.err.println("Usage: BookletSingleWords <dir> <song-id>")
      System.exit(0)
    }
    BookletMain.processWords(args(0), args(1))
  }
}