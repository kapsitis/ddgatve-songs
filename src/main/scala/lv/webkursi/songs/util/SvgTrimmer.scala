package lv.ante.songs.util

import java.io.{FileInputStream,FileWriter}
import scala.xml._
import scala.xml.factory._
import scala.util.matching.Regex

object SvgTrimmer {
	var upperRight: String = ""
	var upperLeft: String = ""
	var bottomLeft: String = ""

	def main(args: Array[String]) {
		val svgContent = XML.load(new FileInputStream(args(0) + ".svg"))		
		val viewBox = svgContent\"@viewBox"
		svgContent\\"text" foreach{(text) => analyze(text)}

		val translateRegex = """translate\(([0-9\.]+), *([0-9\.]+)\)""".r
		val translateRegex(x1,y1) = upperRight
		val translateRegex(x2,y2) = upperLeft
		val translateRegex(x3,y3) = bottomLeft

		val imageSize = new ImageSize("../images/" + args(0) + ".png")
		println("image is " + args(0) + ".png - width = " + imageSize.widthPx + " height = " + imageSize.heightPx)
		
		
		val viewPort = new SvgViewport(viewBox.toString,
				y1.toFloat,y3.toFloat,x2.toFloat,x1.toFloat,
				imageSize.widthPx,imageSize.heightPx)
		var sss = svgContent.toString
		sss = viewPort.svgElement + sss.replaceFirst("""<svg[^<>]+>""","")			
		val fw = new FileWriter("/home/kalvis/workspace/notis-ip/svg/" + args(0) + ".svg")
		fw.write(sss)
		fw.close()
	}
	
	def analyze(node:Node) {
		if ((node\"tspan").toString().indexOf("__") > -1) {
			val temp = (node \\ "@transform").toString()
			if (upperRight.equals("")) {
				upperRight = temp
			}
			else {
				upperLeft = temp
			}
		}
		if ((node\"tspan").toString().indexOf("aaa") > -1) {
			bottomLeft = (node \\ "@transform").toString()
		}
	}
}