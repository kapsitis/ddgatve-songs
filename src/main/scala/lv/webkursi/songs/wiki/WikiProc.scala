package lv.webkursi.songs.wiki

import scala.xml.Unparsed
import scala.xml.MetaData
import scala.xml.TopScope
import scala.xml.Elem
import scala.collection.mutable.LinkedList
import scala.xml.{ Node, NodeSeq, Text, XML }

/**
 * Various utility methods related to wiki processing
 */
object WikiProc {
  val unparsedBR = Unparsed("<br/>")

  /**
   * Parse a string and evaluate it to a string
   */
  def sEval(arg: String): String = {
    val tree = WikiBlockGrammar.parse(arg.trim)
    val result = eval(tree)
    result.toString
  }

  /**
   * Parse a string and evaluate it
   */
  def pEval(arg: String): NodeSeq = {
    val tree = WikiBlockGrammar.parse(arg.trim)
    eval(tree)
  }

  /**
   *
   */
  def eval(arg: List[ASTBlock]): NodeSeq = {
    //    Console.err.println("Processing list of " + arg.size + " elements")
    val procBlocks: List[Elem] = arg map { (block) =>
      {
        val result = block match {
          case ASTPara(txt) =>
            XML.loadString("<p>" + WikiInlineGrammar.parse(txt) + "</p>")
          case ASTOList(lines) => {
            val stanzaLines = lines map { line => line.split("\\\\").length }
            val totalStanzaLines = stanzaLines.foldLeft(0)((_ + _))

            val firstOrSecond = 1.to(stanzaLines.length) map { (i) =>
              2 * (stanzaLines.slice(0, i - 1).foldLeft(0)((_ + _))) >= totalStanzaLines
            }
            val numberedLines = lines.zip(1.to(lines.length))
            val items: List[Node] = numberedLines map { line =>
              if (line._1.indexOf("**Piedz.") > -1) {
                XML.loadString("<li title='-'>" + WikiInlineGrammar.parse(line._1) + "</li>")
              } else {
                XML.loadString("<li title='" + line._2 + ".'>" + WikiInlineGrammar.parse(line._1) + "</li>")
              }
            }

            val itemsFirstOrSecond = items.zip(firstOrSecond)
            val leftItems = (itemsFirstOrSecond filter { !_._2 }) map { _._1 }
            val rightItems = (itemsFirstOrSecond filter { _._2 }) map { _._1 }
            val left = leftItems.foldLeft[NodeSeq](new Text(""))((seq: NodeSeq, e: Node) => seq :+ e)
            val right = rightItems.foldLeft[NodeSeq](new Text(""))((seq: NodeSeq, e: Node) => seq :+ e)

            if (rightItems.length == 0) {
              <ol>{ left }</ol>
            } else {
              <table><tr><td><ol>{ left }</ol></td><td><ol>{ right }</ol></td></tr></table>
            }
          }
          case ASTUList(lines) => {
            val items: List[Node] = lines map { line =>
              XML.loadString("<li>" + WikiInlineGrammar.parse(line) + "</li>")
            }
            val allItems = items.foldLeft[NodeSeq](new Text(""))((seq: NodeSeq, e: Node) => seq :+ e)
            <ul>{ allItems }</ul>
          }
        }
        result
      }
    }
    procBlocks.foldLeft[NodeSeq](new Text(""))((seq: NodeSeq, e: Node) => seq :+ e)
  }

  /**
   * Normalize spaces in a string (used for testing only)
   */
  def normalizeSpaces(arg: String): String = {
    val arg1 = arg.replaceAll("""[\n\r\t]""", " ")
    val arg2 = arg1.replaceAll(""" +""", " ")
    arg2
  }

  /**
   * normalize spaces in wiki syntax tree (used for testing only)
   */
  def nsList(arg: List[ASTBlock]): List[ASTBlock] = {
    arg map { elt => nsBlock(elt, normalizeSpaces) }
  }

  /**
   * Preserve the wiki syntax tree structure, but leave only the first letter
   * of each text snippet.
   */
  def treeList(arg: List[ASTBlock]): List[ASTBlock] = {
    arg map { elt => nsBlock(elt, { s => s.substring(0, 1) }) }
  }

  /**
   * Utility method that replaces text snippets with "mapFn" function
   */
  def nsBlock(arg: ASTBlock, mapFn: String => String): ASTBlock = {
    arg match {
      case ASTPara(x) => ASTPara(mapFn(x))
      case ASTOList(x) => ASTOList(x map { i => mapFn(i) })
      case ASTUList(x) => ASTUList(x map { i => mapFn(i) })
    }
  }
}