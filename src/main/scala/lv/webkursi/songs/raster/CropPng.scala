package lv.webkursi.songs.raster

import java.awt.Rectangle
import java.awt.geom.Rectangle2D
import java.awt.image.RenderedImage
import java.awt.image.renderable.ParameterBlock
import java.io.{ FileOutputStream, OutputStream }
import javax.media.jai.{ JAI, ROI, ROIShape, RenderedOp }
import com.sun.media.jai.codec.{ ImageCodec, ImageEncoder, PNGEncodeParam }

/**
 * This command-line utility is used to autocrop PNG files created by LilyPond.
 * It cuts the bottom part (which has the same boilerplate text displaying LilyPond version),
 * and then eliminates all the white margins.
 */
object CropPng {
  System.setProperty("com.sun.media.jai.disableMediaLib", "true")

  val TOP_LEFT_X = 0
  val TOP_LEFT_Y = 0
  val WIDTH = 835
  val HEIGHT = 1130
//  val WIDTH = 1181
//  val HEIGHT = 1670
  val BOTTOM_CROP = 60

  def main(args: Array[String]) {
    if (args.length < 2) {
      System.err.println("Usage: lv.webkursi.songs.raster.CropPng  [opts] <src-png> <dest-png>")
      System.err.println("Options: ")
      System.err.println("  -a       -- Just autocrop, do not cut boilerplate text from bottom")
      System.err.println("  -bNNN    -- Just cut NNN pixels from the bottom (if -a is not set)")
      System.err.println("  -dWWxHH  -- Override width and height of the source-PNG in pixels")
      System.err.println("              Default value is -d1181x1670")
      System.err.println("  No flags -- the utility first cuts bottom 60 pixels, then autocrops")
      System.exit(0)
    }
    val srcFile = args(args.length - 2)
    val dstFile = args(args.length - 1)

    val flagExpr = """^-([abd])([0-9]+)?(x([0-9]+))?$""".r
    val flags = args map { arg => flagExpr.findFirstIn(arg) } filter { _.isDefined } map { _.getOrElse("") }
    var isAutocropOnly = false
    var isCutbottomOnly = false
    var width = WIDTH
    var height = HEIGHT

    var bottomCrop = BOTTOM_CROP
    for (flag <- flags) {
      val fLetter = flag.substring(1, 2)
      fLetter match {
        case "a" => isAutocropOnly = true
        case "b" => {
          isCutbottomOnly = true
          bottomCrop = flag.substring(2).toInt
        }
        case "d" => {
          val arr = flag.substring(2).split("x")
          width = arr(0).toInt
          height = arr(1).toInt
        }
      }
    }
    //    Console.err.println("isAutocropOnly = " + isAutocropOnly + ", isCutbottomOnly = "  + isCutbottomOnly + ", " + bottomCrop  + "," + width + "," + height)

    val pb = new ParameterBlock()
    pb.add(srcFile)
    val inputRO: RenderedOp = JAI.create("fileload", pb)

    // cut bottom, if necessary
    val outputRO = if (!isAutocropOnly) {
      cropBottom(inputRO)
    } else {
      inputRO
    }

    // auto-crop, if necessary
    val autoCroppedRO = if (!isAutocropOnly && isCutbottomOnly) {
      outputRO
    } else {
      val dim: Array[Int] = getDimensions(outputRO)
      for (i <- 0 until dim.length) {
        System.out.println("dim(" + i + ") = " + dim(i))
      }
      crop(outputRO, dim(2), dim(0), dim(3) - dim(2), dim(1) - dim(0))
    }
    
    val os = new FileOutputStream(dstFile)
    val param = new PNGEncodeParam.Gray()
    val enc = ImageCodec.createImageEncoder("PNG", os, param)
    enc.encode(autoCroppedRO)
    os.close()
  }

  def getDimensions(ri: RenderedImage): Array[Int] = {
    // top side
    var a1 = 0
    var b1 = HEIGHT
    var c1 = 0
    while (b1 - a1 > 1) {
      // System.out.println("TOP a = " + a1 + ", b = " + b1);
      c1 = (b1 + a1) / 2
      var result = measureExtremes(ri, 0, 0, 835, c1)
      if (result == 255) {
        a1 = c1
      } else {
        b1 = c1
      }
    }

    // bottom side
    var a2 = 0
    var b2 = HEIGHT
    var c2 = 0
    while (b2 - a2 > 1) {
      // System.out.println("BOTTOM a = " + a2 + ", b = " + b2);
      c2 = (b2 + a2) / 2
      var result = measureExtremes(ri, 0, HEIGHT - c2, 835, c2)
      if (result == 255) {
        a2 = c2
      } else {
        b2 = c2
      }
    }

    // left side
    var a3 = 0
    var b3 = WIDTH
    var c3 = 0
    while (b3 - a3 > 1) {
      // System.out.println("LEFT a = " + a3 + ", b = " + b3);
      c3 = (b3 + a3) / 2
      var result = measureExtremes(ri, 0, 0, c3, HEIGHT)
      if (result == 255) {
        a3 = c3
      } else {
        b3 = c3
      }
    }

    // right side
    var a4 = 0
    var b4 = WIDTH
    var c4 = 0
    while (b4 - a4 > 1) {
      // System.out.println("RIGHT a = " + a4 + ", b = " + b4);
      c4 = (b4 + a4) / 2
      var result = measureExtremes(ri, WIDTH - c4, 0, c4, HEIGHT)
      if (result == 255) {
        a4 = c4
      } else {
        b4 = c4
      }
    }
    return Array(a1, HEIGHT - a2, a3, WIDTH - a4)

  }

  def measureExtremes(ri: RenderedImage, x: Int, y: Int,
    width: Int, height: Int): Int = {
    val pb = new ParameterBlock()
    pb.addSource(ri) // The source image
    val roi: ROIShape = new ROIShape(new Rectangle(x, y, width, height))
    pb.add(roi)
    pb.add(1) // The horizontal sampling rate
    pb.add(1) // The vertical sampling rate

    // Retrieve both the maximum and minimum pixel value
    val extrema = try {
      val op: RenderedOp = JAI.create("extrema", pb)
      op.getProperty("extrema").asInstanceOf[Array[Array[Double]]]
    } catch {
      case e: Exception => {
        Console.err.println("Exception " + e)
        Array(Array(-1.0, -1.0, -1.0), Array(-1.0, -1.0, -1.0))
      }
    }
    return extrema(0)(0).toInt
  }

  def crop(ri: RenderedImage, x: Int, y: Int, width: Int, height: Int): RenderedOp = {
    val pb = new ParameterBlock()
    pb.addSource(ri)
    pb.add(x.toFloat)
    pb.add(y.toFloat)
    pb.add(width.toFloat)
    pb.add(height.toFloat)
    val outputRO: RenderedOp = JAI.create("Crop", pb)
    return outputRO
  }

  def cropBottom(ri: RenderedImage): RenderedOp = {
    val pb = new ParameterBlock()
    pb.addSource(ri)
    pb.add(TOP_LEFT_X.toFloat)
    pb.add(TOP_LEFT_Y.toFloat)
    pb.add(WIDTH.toFloat)
    pb.add((HEIGHT - BOTTOM_CROP).toFloat)
    val outputRO: RenderedOp = JAI.create("Crop", pb)
    return outputRO
  }

}
