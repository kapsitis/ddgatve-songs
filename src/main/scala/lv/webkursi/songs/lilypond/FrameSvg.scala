package lv.webkursi.songs.lilypond
import java.io.{ FileOutputStream, OutputStreamWriter, BufferedWriter }
import scala.xml.XML
import java.io.FileInputStream
import scala.util.matching.Regex

object FrameSvg {
  def main(args: Array[String]): Unit = {
    if (args.size < 2) {
      println("Usage: FrameSvg <oldSvg> <newSvg>")
      System.exit(0)
    }

    val svgContent = XML.load(new FileInputStream(args(0)))

    // pick the least x-offset for all text snippets (most likely it's bar number)
    val txts = svgContent \\ "g"
    val txttransforms = txts map { _ \\ "@transform" }
    val xList = for (
      txttransform <- txttransforms
    ) yield projX(txttransform.head.text)
    val txtLeftSide = xList.min
    println("txtLeftSide = " + txtLeftSide)

    // find all system lines; find by how much they are offset
    val lines = svgContent \\ "line"
    val lineStarts = lines map { line => (line \\ "@x1").head.text.toFloat }
    val lineLeftSide = lineStarts.min
    val leftSide = if (txtLeftSide < lineLeftSide) txtLeftSide else lineLeftSide
    println("leftSide = " + leftSide)

    // find, where the system lines end; subtract the leftSide to get width
    val lineEnds = lines map { line => (line \\ "@x2").head.text.toFloat }
    val lineEndsMax = lineEnds.max
    val maxLines = lines filter { line => (line \\ "@x2").head.text.toFloat == lineEndsMax }
    val linetransforms = maxLines map { _ \\ "@transform" }
    val lineXList = for (linetransform <- linetransforms)
      yield projX(linetransform.head.text)
    val lineShift = lineXList.max
    var fullWidth = lineEnds.max + lineShift + 0.1 - leftSide
    println("fullWidth = " + fullWidth)

    val borders = txts filter (s => (s \\ "tspan").head.text.trim.equals("__"))
    val btransforms = borders map { _ \\ "@transform" }
    val borderYList = for (
      btransform <- btransforms
    ) yield projY(btransform.head.text)
    val topSide = borderYList.min
    val fullHeight = borderYList.max - topSide

    println("topSide = " + topSide)
    println("fullHeight = " + fullHeight)

    val sss = svgContent.toString
    if (sss.indexOf("rgb(100.0%, 0.0%, 0.0%)") > -1) {
      fullWidth += 1
    }

    //val pxWidth = 600
    //val pxHeight = Math.round(600.0 * fullHeight / fullWidth).toInt
    val pxWidth:Float = (210.00F / 119.5016F * fullWidth).toFloat
    val pxHeight:Float = (pxWidth * fullHeight / fullWidth).toFloat
    
    println("pxWidth = " + pxWidth)
    println("pxHeight = " + pxHeight)

    val sss1 = sss.replaceAll("__</tspan>", " </tspan>")
    val svgElement =
      "<svg xmlns=\"http://www.w3.org/2000/svg\" " +
        "xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"1.2\" width=\"" +
        pxWidth + "mm\" height=\"" + pxHeight + "mm\" viewBox=\"" +
        leftSide + " " + topSide + " " + fullWidth + " " + fullHeight + "\">"

    val sss2 = svgElement + sss1.replaceFirst("""<svg[^<>]+>""", "")
    val bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("_" + args(1)), "UTF-8"))
    bw.write(sss2)
    bw.close()

  }

  def projX(arg: String): Float = {
    val translate = new Regex("""translate\(([0-9\.]+), ?([0-9\.]+)\)""")
    arg match {
      case translate(x, y) => {
        x.toFloat
      }
      case _ => {
        println("Could not parse " + arg)
        9999
      }
    }
  }

  def projY(arg: String): Float = {
    val translate = new Regex("""translate\(([0-9\.]+), ?([0-9\.]+)\)""")
    arg match {
      case translate(x, y) => {
        y.toFloat
      }
      case _ => {
        println("Could not parse " + arg)
        9999
      }
    }
  }
}