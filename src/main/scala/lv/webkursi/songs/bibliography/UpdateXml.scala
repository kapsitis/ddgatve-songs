package lv.webkursi.songs.bibliography
import scala.xml.Node
import scala.xml.Elem
import scala.collection.mutable.HashMap
import scala.xml.Unparsed

/**
 * Fix the XML node - replacing under "source" the keys as in idMap.
 */
object UpdateXml {
  def updateVersion(node: Node, idMap: HashMap[String, String], fName: String): Node = {
    def updateNodes(ns: Seq[Node], fName: String): Seq[Node] = {
      for (subnode <- ns) yield subnode match {
        case <source>{ x }</source> => <sources>{ srcReplace(x.text, idMap, fName) }</sources>
        case <source></source> => <sources>{ new Unparsed("\n<!--<source label=''/>-->\n") }</sources>
        case Elem(prefix, elt, attribs, scope, children @ _*) =>
          Elem(prefix, elt, attribs, scope, updateNodes(children, fName): _*)
        case other => other
      }
    }
    updateNodes(node.theSeq, fName)(0)
  }

  /**
   * The input argument looks like this:
   * <code>[a-zA-Z0-9]+(,[p.|#][0-9]+)?|[a-zA-Z0-9]+(,[p.|#][0-9]+)?|...</code>
   * In this argument replace all instances of [a-zA-Z0-9]+ (before commas)
   * with the values from the map.
   */
  def srcReplace(arg: String, idMap: HashMap[String, String], fName: String): Unparsed = {
    val lst = arg.split("""\|""").toList map { x => x.trim }    
    val brList = lst map (x => BibReference.makeStRef(x,idMap))
    val brStrings = brList map (_.toString())
    
    new Unparsed(brStrings.foldLeft("")(_ + "\n" + _) + "\n")
  }
}
