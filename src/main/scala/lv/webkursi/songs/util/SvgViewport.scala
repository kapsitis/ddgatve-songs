package lv.ante.songs.util

class SvgViewport(viewBox:String, pieceBottom:Float, markupBottom:Float,
			pieceLeft:Float, opusLeft:Float, widthPx:Int, heightPx:Int) {
	
	private val deltaHeightPx = -12
	private val deltaY0 = 0.64F*1.405838918F
	private val deltaHeight = -1.72F*1.405838918F
	private val deltaX0 = -1.35F*1.405838918F
	private val deltaWidth = 3.75F
	
	private val fourParts = viewBox.split(" ")
	private val unitsPerMmHorizontal = fourParts(2).toFloat / 210.0F;
	private val unitsPerMmVertical = fourParts(3).toFloat / 297.0F;
    private val unitsPerMm = (unitsPerMmHorizontal + unitsPerMmVertical)/2.0F;

	private val y0 = pieceBottom + deltaY0*unitsPerMm
	private val height = markupBottom - y0.floatValue() + deltaHeight*unitsPerMm
	private val x0 = if (pieceLeft + deltaX0*unitsPerMm > 0) pieceLeft + deltaX0*unitsPerMm else 0F
	private val width = opusLeft - x0.floatValue() + deltaWidth*unitsPerMm
	
	
	val w = widthPx
	val h = heightPx + deltaHeightPx
	val vp = "" + x0 + " " + y0 + " " + width + " " + height
	val svgElement = "<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"1.2\" width=\"" + w + "\" height=\"" + h + "\" viewBox=\"" + vp + "\">"
}