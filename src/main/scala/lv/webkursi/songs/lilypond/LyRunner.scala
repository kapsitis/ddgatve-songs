package lv.webkursi.songs.lilypond
import java.io.File
import lv.webkursi.songs.raster.CropPng

/**
 * The utility object to do mass compilation tasks for Lilypond.
 * It receives one argument - the base directory containing
 * "lilypond", "png", "midi", "svg" subdirectories, and compiles all
 * files under "lilypond" with extension "*.ly", and places the compilation
 * results in the other subdirectories - "png", "midi" and "svg".
 */
object LyRunner {
  def main(args: Array[String]): Unit = {
    if (args.size < 2) {
      Console.err.println("Usage: LyRunner <base-directory> <options>")
      Console.err.println("    base-directory: directory to compile (with lilypond subdirectory)")
      Console.err.println("    options: files to generate (m=MIDI, p=PNG, s=SVG)")
      System.exit(0)
    }
    val baseDir = args(0)
    val options = args(1)

    val myEnv = new Env(baseDir + "/lilypond")
    val lyDir = new File(baseDir + "/lilypond")
    val lyFiles: List[String] = lyDir.list.toList filter (_.endsWith(".ly"))
    val lySorted = lyFiles.sortWith((x, y) => x.compareTo(y) < 0)

    for (lyFile <- lySorted) {
      val lyRoot = lyFile.replace(".ly", "")
      val firstChar = lyRoot.substring(0,1).toCharArray()(0)
      val secondChar = lyRoot.substring(1,2).toCharArray()(0)
      if (firstChar < 'A' || (firstChar == 'A' && secondChar < 'a') || lyRoot.equals("KurTece-siTuPeli-te")) {
        println("Skipping " + lyRoot)
      } else {
        println("Processing " + lyRoot)
        if (options.indexOf("p") > -1) {
          myEnv.run("lilypond", "-fpng", lyFile)
          CropPng.main(Array(baseDir + "/lilypond/" + lyRoot + ".png",
            baseDir + "/lilypond/" + lyRoot + ".new.png"))
          FileUtils.move(baseDir + "/lilypond/" + lyRoot + ".new.png",
            baseDir + "/png/" + lyRoot + ".png")
          FileUtils.move(baseDir + "/lilypond/" + lyRoot + ".mid",
            baseDir + "/midi/" + lyRoot + ".midi")
          FileUtils.move(baseDir + "/lilypond/" + lyRoot + ".midi",
            baseDir + "/midi/" + lyRoot + ".midi")
        }
        if (options.indexOf("s") > -1) {
          myEnv.run("lilypond", "-dbackend=svg", lyFile)
          FrameSvg.main(Array(baseDir + "/lilypond/" + lyRoot + ".svg",
            baseDir + "/svg/" + lyRoot + ".svg"))
        }

        List(".mid", ".midi", ".png", ".new.png", ".svg") map { ext =>
          new File(baseDir + "/lilypond/" + lyRoot + ext)
        } foreach (x => {
          if (x.exists) {
            val success = x.delete
            println(if (success) "Deleted " + x.getCanonicalPath
            else "Could not delete " + x.getCanonicalPath)
          } else println("Could not find file " + x.getCanonicalPath)
        })
      }
    }
  }
}