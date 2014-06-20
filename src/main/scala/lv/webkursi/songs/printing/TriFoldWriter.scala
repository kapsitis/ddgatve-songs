package lv.webkursi.songs.printing

import java.io.{ FileOutputStream, IOException }
import com.itextpdf.text.{ Document, PageSize, Rectangle }
import com.itextpdf.text.pdf.{ PdfContentByte, PdfImportedPage, PdfReader, PdfWriter }

object TriFoldWriter {

  /**
   * Utility to convert A4-format PDF file to another A4 PDF - which has
   * trifold structure; each page is scaled by 70.7% and rotated as needed
   */
  def main(args: Array[String]): Unit = {
    if (args.size < 1) {
      Console.err.println("Usage: TriFoldWriter <pdf-file>")
      System.exit(0)
    }
    val inFile = args(0)
    val outFile = if (inFile.endsWith(".pdf")) {
      inFile.substring(0, inFile.length - 4) + ".3fold.pdf"
    } else {
      inFile + ".3fold.pdf"
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

    val thirdHeight = PageSize.A4.getHeight() / 3f

    val triFoldSeq = List(5,6,7,8,9,3)
    val pages = triFoldSeq map { pgNum =>
      if (pgNum <= numPages) { Some(writer.getImportedPage(reader, pgNum)) }
      else { None }
    }
    val horizOffset = List(0f, thirdHeight, 2 * thirdHeight, 0f, thirdHeight, 2 * thirdHeight)
    for (i <- 0 until triFoldSeq.size) {
      pages(i) match {
        case Some(imported) => {
          cb.addTemplate(imported, scaleRatio, 0f, 0f, scaleRatio, horizOffset(i)-18f, 0f)
        }
        case None => {}
      }
      if (i == 2) document.newPage
    }

    document.close
  }
}