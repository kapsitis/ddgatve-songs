package lv.ante.songs.util

import java.awt._

class ImageSize(imageFile: String) extends Frame {

	val image = buildImage(imageFile)
	val widthPx = image.getWidth(null);
	val heightPx = image.getHeight(null);

	private def buildImage(imageFile: String):Image = {
		val tool = Toolkit.getDefaultToolkit()
		val image = tool.getImage(imageFile)
		val mTracker = new MediaTracker(this)
		mTracker.addImage(image, 1)
		mTracker.waitForID(1);
		image
	}
}