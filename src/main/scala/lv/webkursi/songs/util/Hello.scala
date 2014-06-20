package lv.webkursi.songs.util

import Process._
import scala.xml._

object Hello {
  
  def normalizeSpaces(arg:String):String = {
    val arg1 = arg.replaceAll("""[\n\r]"""," ")
    val arg2 = arg1.replaceAll(""" +""", " ")
    arg2
  }
  
  def main(args: Array[String]): Unit = {    
    val lyrics = """Mazs zaķīts,
mazs kaķīts, 
uz ceļa satikās
(J.Poruks)"""
    	println(normalizeSpaces(lyrics))
    	
  }
}