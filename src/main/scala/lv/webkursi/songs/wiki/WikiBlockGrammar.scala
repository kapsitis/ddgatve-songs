package lv.webkursi.songs.wiki

import scala.util.parsing.combinator._

/**
 * expr ::= block ("\n\n" block)*
 * block ::= blockpara | blockolist | blockulist
 * blockpara ::= para
 * blockolist ::= olist
 * blockulist ::= ulist
 * para ::= words ("\n" words)*
 * olist ::= "# " words ("\n" "# " words)*
 * ulist ::= "* " words ("\n" "* " words)*
 * words ::= [^\n\*#]+          (anything, including inline markup)
 */
object WikiBlockGrammar extends JavaTokenParsers {
  def expr: Parser[List[ASTBlock]] = block ~ rep(newlines ~> block) ^^
    ((x) => x._1 :: (x._2))
  def block: Parser[ASTBlock] = blockpara | blockolist | blockulist
  def blockpara: Parser[ASTBlock] = para ^^
    ((x) => ASTPara(nlines(x)))
  def blockolist: Parser[ASTBlock] = olist ^^
    ((x) => ASTOList(x map nlines))
  def blockulist: Parser[ASTBlock] = ulist ^^
    ((x) => ASTUList(x map nlines))
  def olist: Parser[List[String]] = "# " ~> words ~ rep("@" ~> "# " ~> words) ^^
    ((x) => x._1 :: (x._2))
  def ulist: Parser[List[String]] = "* " ~> words ~ rep("@" ~> "* " ~> words) ^^
    ((x) => x._1 :: (x._2))
  def para: Parser[String] = words ^^
    ((x) => x)
  def words = regex("""(\*\*|[^@#\*])[^@]*(@(\*\*|[^@#\*])[^@]*)*""".r)
  def newlines = regex("""@[@\s]*@""".r)
  

  def parse(arg: String): List[ASTBlock] = {
	val arg1 = arg.replaceAll("@", "&#64;")
    val arg2 = arg1.replaceAll("\r\n", "@")
    val arg3 = arg2.replaceAll("\n", "@")
    parseAll(expr, arg3).get
  }
  
  def parseWords(arg:String): String = {
	val arg1 = arg.replaceAll("@", "&#64;")
    val arg2 = arg1.replaceAll("\r\n", "@")
    val arg3 = arg2.replaceAll("\n", "@")
    Console.err.println("arg3 = " + arg3)
    parseAll(words, arg3).get
	  
  }
  
  def nlines(arg:String): String = {
	  arg.replaceAll("@", "\r\n")
  }
}
