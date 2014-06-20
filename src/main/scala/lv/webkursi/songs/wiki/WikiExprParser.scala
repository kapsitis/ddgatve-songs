package lv.webkursi.songs.wiki

import scala.util.parsing.combinator._
import scala.util.matching.Regex

import scala.collection.mutable.Queue

object WikiExprParser extends RegexParsers {

  override def skipWhitespace = false
  private def plain = regex(new Regex("""[^_\*\\]+"""))
  private def asterisk = regex("""\*""".r)
//  private def underline = regex("_".r)
  private def backslashes = regex("""\\\\""".r)
  private def everything = (plain | asterisk | backslashes) *

  def parseItem(str: String) = parseAll(everything, str)

  def tokenList(str: String): List[String] = {
    parseItem(str).get
  }

  def decorations(tokens: List[String]): List[(String, Int, Int)] = {
    val result = for (
      i <- 0 until tokens.length;
      asterisks = countMod(tokens, i, "*");
      underscores = countMod(tokens, i, "_")
    ) yield (tokens(i), asterisks % 2, underscores % 2)
    result.toList
  }

  def countMod(tokens: List[String], i: Int, modifier: String): Int = {
    tokens.slice(0, i).count(t => t.equals(modifier))
  }

  def buildWikiExpr(decs: List[(String, Int, Int)]): ASTInline = {
    val fdecs = decs.filter(item => { val s = item._1; !s.equals("*") && !s.equals("_") })
    var queue = Queue[ASTInline]()
    for (fdec <- fdecs) {
      val e: ASTInline = fdec match {
        case ("\\\\", _, _) => ASTBreak()
        case (s, 1, 0) => ASTBold(ASTPlain(s))
        case (s, 0, 1) => ASTItalic(ASTPlain(s))
        case (s, 1, 1) => ASTItalic(ASTBold(ASTPlain(s)))
        case (s, _, _) => ASTPlain(s)
      }
      queue.enqueue(e)
    }
    val exprList = queue.toList
    if (exprList.length == 0) ASTPlain("")
    else (if (exprList.length == 1) exprList(0)
    else ASTSeq(exprList))
  }
  
  def parseExpr(s:String):ASTInline = {
    val tokens: List[String] = tokenList(s)
    val decs = decorations(tokens)
    buildWikiExpr(decs)  
  }
}