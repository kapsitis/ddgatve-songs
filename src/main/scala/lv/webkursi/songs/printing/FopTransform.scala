package lv.webkursi.songs.printing

import java.io.{BufferedOutputStream,File,FileOutputStream}
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import org.apache.fop.apps.FopFactory;
import org.apache.xmlgraphics.util.MimeConstants;

/**
 * This command-line utility can run XSLT transformations. 
 */
object FopTransform {

  def main(args: Array[String]): Unit = {
    val fopFactory = FopFactory.newInstance();

    fopFactory.setUserConfig(new File("c:/tools/fop-1.0/conf/fop.xconf"));

    val out = new BufferedOutputStream(new FileOutputStream(
      new File("resources/fo/Mushas.pdf")));

    try {
      val fop = fopFactory.newFop(MimeConstants.MIME_PDF, out);
      val factory = TransformerFactory.newInstance();
      // Transformer transformer = factory.newTransformer();
      val xslt = new StreamSource(new File("resources/fo/The_Flies.xsl"));
      val transformer = factory.newTransformer(xslt);

      val src = new StreamSource(new File("resources/fo/The_Flies.xml"));
      val res = new SAXResult(fop.getDefaultHandler());
      transformer.transform(src, res);
    } finally {
      out.close();
    }
  }
}
