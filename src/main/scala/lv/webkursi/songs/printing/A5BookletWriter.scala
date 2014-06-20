package lv.webkursi.songs.printing

import java.io.{ FileOutputStream, IOException }
import com.itextpdf.text.{ Document, PageSize, Rectangle }
import com.itextpdf.text.pdf.{ PdfContentByte, PdfImportedPage, PdfReader, PdfWriter }

object A5BookletWriter {

  /**
   * Utility to convert A4-format PDF file to another A4 PDF - which has
   * every page reduced with a scale ratio 70.7%, rotated and ordered as in a booklet.
   */
  def main(args: Array[String]): Unit = {
    if (args.size < 1) {
      Console.err.println("Usage: A5BookletWriter <pdf-file>")
      System.exit(0)
    }
    val inFile = args(0)
    val outFile = if (inFile.endsWith(".pdf")) {
      inFile.substring(0, inFile.length - 4) + ".a5.pdf"
    } else {
      inFile + ".a5.pdf"
    }

    val document = new Document()

    println("A4.getHeight() = " + PageSize.A4.getHeight)
    println("leftMargin = " + document.leftMargin)
    println("rightMargin = " + document.rightMargin)
    println("topMargin = " + document.topMargin)
    println("bottomMargin = " + document.bottomMargin)

    val reader = new PdfReader(inFile)
    val numPages = reader.getNumberOfPages
    println("numpages = " + numPages)
    val N = Math.ceil(numPages / 4f).toInt

    val writer = PdfWriter.getInstance(document, new FileOutputStream(outFile))
    document.setPageSize(PageSize.A4.rotate)
    document.setMargins(36f, 36f, 36f, 36f)
    document.open

    val cb: PdfContentByte = writer.getDirectContent
    val scaleRatio = Math.sqrt(0.5f).toFloat
    val halfHeight = PageSize.A4.getHeight() / 2f
    val pageSeq = (0 until N) map { i =>
      List(2 * i + 1, 4 * N - 2 * i, 2 * i + 2, 4 * N - 2 * i - 1)
    }

    pageSeq foreach { x =>
      {
        val pages = x map { pgNum =>
          if (pgNum <= numPages) { Some(writer.getImportedPage(reader, pgNum)) }
          else { None }
        }
        val horizOffset = List(halfHeight, 0f, 0f, halfHeight)
        for (i <- 0 until 4) {
          pages(i) match {
            case Some(imported) => {
              cb.addTemplate(imported, scaleRatio, 0f, 0f, scaleRatio, horizOffset(i), 0f)
            }
            case None => {}
          }
          if (i % 2 == 1) document.newPage
        }
      }
    }
    document.close
  }
}