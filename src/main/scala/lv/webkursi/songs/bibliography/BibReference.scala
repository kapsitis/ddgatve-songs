package lv.webkursi.songs.bibliography

import scala.reflect.BeanProperty
import scala.collection.mutable.HashMap
import scala.xml.Node
import scala.xml.NodeSeq
import scala.xml.Unparsed
import scala.xml.Text

class BibReference(val label: String, val code: String, val page: Int) {
  var errMessage = ""

  val plainOutput = false

  override def toString(): String = {
    if (plainOutput) {
      label + (if (code.equals("")) "" else ",#" + code) +
        (if (page == -1) "" else ",p." + page)
    } else {
      if (code.equals("") && page == -1) {
        "<source label='" + label + "'/>"
      } else if (code.equals("") && page != -1) {
        "<source label='" + label + "' page='" + page + "'/>"
      } else if (!code.equals("") && page == -1) {
        "<source label='" + label + "' code='" + code + "'/>"
      } else {
        "<source label='" + label + "' code='" + code +
          "' page='" + page + "'/>"
      }
    }
  }
  def toXml(): Node = {
    if (code.equals("") && page == -1) {
      <source label={ label }/>
    } else if (code.equals("") && page != -1) {
      <source label={ label } page={ page.toString() }/>
    } else if (!code.equals("") && page == -1) {
      <source label={ label } code={ code }/>
    } else {
      <source label={ label } code={ code } page={ page.toString() }/>
    }
  }
}

object BibReference {
  /**
   * Parsing from strings like this is only needed for legacy data.
   * Normally the XML data structures should be already as parsed XML.
   */
  protected def makeRef(arg: String): BibReference = {
    val Ref = """^(#?[^,]+[a-zA-Z0-9\.])(,#[a-zA-Z0-9_]+)?(,p\.[0-9]+)?$""".r
    val Ref(label, codeStr, pgStr) = arg
    val page =
      if (pgStr == null || pgStr.equals("")) -1
      else pgStr.substring(3).toInt
    val code = if (codeStr == null) "" else codeStr.substring(2)
    val result = new BibReference(label, code, page)
    result
  }

  def makeStRef(arg: String, idMap: HashMap[String, String]): BibReference = {
    val br = makeRef(arg)
    standardize(br, idMap)
  }

  /**
   * Rename label, if the old label became unusable
   */
  def standardize(br: BibReference, idMap: HashMap[String, String]): BibReference = {
    val newLabel = idMap.get(br.label) match {
      case Some(x) => ("", x)
      case None => {
        Console.err.println("Nonexisting label " + br.label)
        br.errMessage = "Nonexisting label " + br.label
        ("Nonexisting label " + br.label, br.label)
      }
    }
    val result = new BibReference(newLabel._2, br.code, br.page)
    result.errMessage = newLabel._1
    result
  }
  
    /**
   * Transform the XML sources from the songs.dtd format to HTML, which 
   * is later used to produce booklets
   */
  def xmlToHtml(sources: NodeSeq): NodeSeq = {
    val bibList = (sources\\"source").theSeq map { src =>
      {
        val label = src.attribute("label").get.head.text

        val code = src.attribute("code") match {
          case Some(x) => ",#" + x.head.text
          case None => ""
        }
        
        val page = src.attribute("page") match {
          case Some(x) => ",p." + x.head.text
          case None => ""
        }
        <p><span>{ "[" + label + "]" }</span>{ code+page }</p>
      }
    }
    val withNewLines = bibList map {x => List(x,new Text("\n"))}
    withNewLines.flatten.dropRight(1)
  }
}