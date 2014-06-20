package lv.webkursi.songs.wiki
import scala.util.parsing.combinator.RegexParsers

object MyParsers extends RegexParsers {
  val newline: Parser[String] = """\n""".r
  val words: Parser[String] = """[a-zA-Z0-9_ ]""".r
}