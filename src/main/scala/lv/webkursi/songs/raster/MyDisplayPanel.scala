package lv.webkursi.songs.raster

import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Insets;
import java.awt.geom.AffineTransform;
import java.awt.image.RenderedImage;

import javax.swing.JPanel;

/**
 * Very simple class for displaying RenderedImages
 */
class MyDisplayPanel(var source: RenderedImage) extends JPanel {

  setPreferredSize(new Dimension(source.getWidth(), source.getHeight()));

  override def paintComponent(g: Graphics): Unit = {
    val g2d: Graphics2D = g.asInstanceOf[Graphics2D]
    val insets = getInsets()
    val tx = insets.left - source.getMinX()
    val ty = insets.top - source.getMinY()
    val af = AffineTransform.getTranslateInstance(tx, ty)
    g2d.drawRenderedImage(source, af)
  }
}