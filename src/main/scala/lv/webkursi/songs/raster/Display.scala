package lv.webkursi.songs.raster

import java.awt.event.WindowAdapter
import java.awt.event.WindowEvent
import java.awt.event.WindowListener
import java.awt.image.renderable.ParameterBlock
import javax.media.jai.JAI
import javax.media.jai.RenderedOp
import javax.swing.JFrame
import javax.swing.JScrollPane;
import javax.swing.WindowConstants

/**
 * This command-line utility displays PNG files immediately after compilation.
 * The class allows to read, scale (by hardcoded factor 1.0) and display an image.
 */
object Display {
  System.setProperty("com.sun.media.jai.disableMediaLib", "true")

  def getJFrame(filename: String): JFrame = {
    val result = new JFrame
    val pb = new ParameterBlock()
    pb.add(filename)
    val inputRO: RenderedOp = JAI.create("fileload", pb)

    val pb2 = new ParameterBlock()
    pb2.addSource(inputRO)
    pb2.add(1.0F) // x dimension scale factor
    pb2.add(1.0F) // y dimension scale factor
    val scaledRO: RenderedOp = JAI.create("scale", pb2)

    result.getContentPane().setSize(200, 200)
    result.getContentPane().add(new JScrollPane(new MyDisplayPanel(scaledRO)))
    result.pack()
    result.show()
    result
  }

  def main(args: Array[String]): Unit = {
    if (args.length != 1) {
      System.err
        .println("Usage: lv.webkursi.songs.raster.Display <png-file>")
      System.exit(0)
    }
    val dd = getJFrame(args(0));
    dd.setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE)
    val windowListener: WindowListener = new WindowAdapter() {
      override def windowClosing(w: WindowEvent): Unit = {
        dd.setVisible(false)
        dd.dispose()
      }
    }
    dd.addWindowListener(windowListener)
  }
}
