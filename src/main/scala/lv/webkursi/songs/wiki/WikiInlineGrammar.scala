package lv.webkursi.songs.wiki

import scala.util.parsing.combinator._

/**
 * inline ::= text (" " text)*
 * text ::= plaintext | boldtext | italictext
 * regulartext ::= plaintext
 * boldtext ::= "**" text "**"
 * italictext ::= "//" text "//"
 * regulartext ::= [^\n\*#/]+   (anything)
 */
object WikiInlineGrammar extends JavaTokenParsers {
  
  override def skipWhitespace = false
  
  val rePlaintext = """([^@\*/\\].?)*[^@\*/\\]""".r
  val reUrl = """http:&#47;&#47;[^\s]+""".r
  
  def inline: Parser[String] = rep(text) ^^
    ((x) => x.foldLeft[String]("")((x, y) => x  +  y))
  def text: Parser[String] = boldtext | italictext | url |
    spaces | slashes | plaintext ^^
    ((x) => x)
  def boldtext: Parser[String] = "**" ~> inline <~ "**" ^^
    ((x) => "<b>" + x + "</b>")
  def italictext: Parser[String] = "//" ~> inline <~ "//" ^^
    ((x) => "<i>" + x + "</i>")
  def url: Parser[String] = regex(reUrl) ^^
    ((x) => "<em>" + x + "</em>")
  def plaintext: Parser[String] = regex(rePlaintext) ^^
    ((x) => x)
  def slashes: Parser[String] = regex("""\\\\""".r) ^^
    ((x) => "<br />")
  def spaces: Parser[String] = regex("""\\s+""".r) ^^
    ((x) => x)

  def parse(arg: String): String = {
    val arg1 = arg.replaceAll("http://", "http:&#47;&#47;")
    val result = parseAll(inline, arg1).get
    result.replaceAll("&#47;","/")
    
//    parseAll(inline, arg).get
  }

  def parseInline(arg: String): String = {
    parseAll(inline, arg).get
  }

  def parseBold(arg: String): String = {
    parseAll(boldtext, arg).get
  }

  def parseText(arg: String): String = {
    parseAll(text, arg).get
  }

  def parseUrl(arg: String): String = {
    parseAll(url, arg).get
  }

  def parseSpaces(arg: String): String = {
    parseAll(spaces, arg).get
  }
  
  def parseSlashes(arg: String): String = {
    parseAll(slashes, arg).get
  }
  
}
