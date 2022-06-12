package lv.webkursi.songs.wiki

/**
 * http://www.wikicreole.org/wiki/Creole1.0
 */
abstract class ASTExpr
case class ASTText(blocks: List[ASTBlock]) extends ASTExpr

abstract class ASTBlock
case class ASTPara(txt: String) extends ASTBlock
case class ASTOList(items: List[String]) extends ASTBlock
case class ASTUList(items: List[String]) extends ASTBlock

abstract class ASTInline
case class ASTPlain(s: String) extends ASTInline
case class ASTItalic(e1: ASTInline) extends ASTInline
case class ASTBold(e1: ASTInline) extends ASTInline
case class ASTBreak() extends ASTInline
case class ASTSeq(exprs:List[ASTInline]) extends ASTInline