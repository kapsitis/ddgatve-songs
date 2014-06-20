package lv.webkursi.songs.printing
import scala.math.Integral

class Motive(songId: String, num: Int, melody: List[String], trans: Int) {
  def getSongId(): String = {
    songId
  }

  def getTrans(): Int = {
    trans
  }

  def getMelody(): List[String] = {
    melody
  }

  override def toString(): String = {
    "Motive(" + songId + "," + num + "," + melody + "," + trans + ")"
  }

  def getLilypond(): String = {
    val key = trans match {
      case 0 => """\key c \major"""
      case 5 => """\key f \major"""
      case 7 => """\key g \major"""
      case _ => """\key c \major"""
    }
    val lilyText = ((melody.head + "4") /: melody.tail)(_ + " " + _)

    """\version "2.13.16"
fullScore = \new Staff \with {
\remove Time_signature_engraver
\remove Bar_engraver
}
\relative g' {""" + '\n' + key + '\n' +
      """\override Stem #'transparent = ##t""" + '\n' +
      lilyText + '\n' +
      """}

\score {
\fullScore
\header { piece = "__" opus = "__" }
}
\markup { \with-color #(x11-color 'red) \sans \smaller "__" }"""
  }

}

object Motive {

  val perfectFourth = Map("c" -> "f", "cis" -> "fis", "des" -> "ges", "d" -> "g",
    "dis" -> "gis", "ees" -> "aes", "e" -> "a", "eis" -> "ais",
    "fes" -> "beses", "f" -> "bes", "fis" -> "b", "ges" -> "ces", "g" -> "c",
    "gis" -> "cis", "aes" -> "des", "a" -> "d", "ais" -> "dis",
    "bes" -> "ees", "b" -> "e", "bis" -> "eis", "ces" -> "fes")

  val perfectFifth = Map("c" -> "g", "cis" -> "gis", "des" -> "aes", "d" -> "a",
    "dis" -> "ais", "ees" -> "bes", "e" -> "b", "eis" -> "bis",
    "fes" -> "ces", "f" -> "c", "fis" -> "cis", "ges" -> "des", "g" -> "d",
    "gis" -> "dis", "aes" -> "ees", "a" -> "e", "ais" -> "eis",
    "bes" -> "f", "b" -> "fis", "bis" -> "fisis", "ces" -> "ges");
  def transposeByFourth(melody: List[String]): List[String] = {
    melody map { m =>
      {
        val notsRegex = """([a-g]e?i?s?)([',]*)""".r
        val notsRegex(a, b) = m
        perfectFourth(a) + b
      }
    }
  }

  def transposeByFifth(melody: List[String]): List[String] = {
    melody map { m =>
      {
        val notsRegex = """([a-g]e?i?s?)([',]*)""".r
        val notsRegex(a, b) = m
        perfectFifth(a) + b
      }
    }
  }

  def unzipMelody(melody: List[String]): List[(String, String)] = {

    Nil
  }
  /**
   * true, if "ma" is a prefix of "mb" or both are equal
   */
  def isPrefix(mma: List[String], mmb: List[String]): Boolean = {
    val lmin = mma.length.min(mmb.length)
    val mma2 = mma.slice(0, lmin)
    val mmb2 = mmb.slice(0, lmin)
    return (mma.length <= mmb.length && mma2 == mmb2)
  }

  /**
   * "true" if "ma" precedes "mb" in the ordering of motives.
   */
  def lt(ma: Motive, mb: Motive): Boolean = {
    val mma = ma.getMelody
    val mmb = mb.getMelody
    println("mma = " + mma)
    println("mmb = " + mmb)
    if (mma == mmb) {
      return false
    }
    if (isPrefix(mma, mmb)) {
      return true
    }
    if (isPrefix(mmb, mma)) {
      return false
    }
    val lmin = mma.length.min(mmb.length)
    val ff = (0 until lmin) find { i => mma(i) != mmb(i) }
    val ffInt = ff match {
      case Some(i) => i
      case _ => {
        Console.err.println("WARNING: prefixes of motives not correctly processed")
        0
      }
    }

    val nameOrder = Map("c" -> 0, "cis" -> 1, "des" -> 2, "d" -> 3,
      "dis" -> 4, "ees" -> 5, "e" -> 6, "eis" -> 7,
      "fes" -> 8, "f" -> 9, "fis" -> 10, "ges" -> 11, "g" -> 12,
      "gis" -> 13, "hes" -> 14, "a" -> 15, "ais" -> 16,
      "bes" -> 17, "b" -> 18, "bis" -> 19, "ces" -> 20)

    if (ffInt == 0) {
      return (nameOrder(mma(0)) - nameOrder(mmb(0)) < 0)
    }
    val base = mma(ffInt - 1)
    val jumpA = findInterval(base, mma(ffInt))
    val jumpB = findInterval(base, mmb(ffInt))
    if (jumpA == 0) return true
    if (jumpB == 0) return false
    if (jumpA > 0 && jumpB < 0) return true
    if (jumpA < 0 && jumpB > 0) return false
    if (jumpA > 0 && jumpB > 0) return jumpA < jumpB
    if (jumpA < 0 && jumpB < 0) return jumpA > jumpB

    Console.err.println("WARNING: No match for " + mma + " and " + mmb + ", ff = " + ff)
    true
  }

  def findInterval(first: String, second: String): Int = {
    val letterValues = Map("c" -> 0, "d" -> 2, "e" -> 4, "f" -> 5, "g" -> 7, "a" -> 9, "b" -> 11)

    val upOrDown = Map(
      "cc" -> 0, "cd" -> 1, "ce" -> 1, "cf" -> 1, "cg" -> -1, "ca" -> -1, "cb" -> -1,
      "dd" -> 0, "de" -> 1, "df" -> 1, "dg" -> 1, "da" -> -1, "db" -> -1, "dc" -> -1,
      "ee" -> 0, "ef" -> 1, "eg" -> 1, "ea" -> 1, "eb" -> -1, "ec" -> -1, "ed" -> -1,
      "ff" -> 0, "fg" -> 1, "fa" -> 1, "fb" -> 1, "fc" -> -1, "fd" -> -1, "fe" -> -1,
      "gg" -> 0, "ga" -> 1, "gb" -> 1, "gc" -> 1, "gd" -> -1, "ge" -> -1, "gf" -> -1,
      "aa" -> 0, "ab" -> 1, "ac" -> 1, "ad" -> 1, "ae" -> -1, "af" -> -1, "ag" -> -1,
      "bb" -> 0, "bc" -> 1, "bd" -> 1, "be" -> 1, "bf" -> -1, "bg" -> -1, "ba" -> -1)

    val second2 = second.replaceAll("'", "")
    val second3 = second2.replaceAll(",", "")
    val first2 = first.replaceAll("'", "")
    val first3 = first2.replaceAll(",", "")
    val delta1 = if (first3.endsWith("is")) 1 else { if (first3.endsWith("es")) -1 else 0 }
    val delta2 = if (second3.endsWith("is")) 1 else { if (second3.endsWith("es")) -1 else 0 }

    val second5 = second.substring(0, 1)
    val first5 = first.substring(0, 1)

    val diff0 = letterValues(second5) - letterValues(first5) + delta2 - delta1
    val diff1 = if (diff0 * upOrDown(first5 + second5) < 0) {
      diff0 + 12 * upOrDown(first5 + second5)
    } else {
      diff0
    }
    val diff2 = diff1 + 12 * getOctave(second)
    diff2
  }

  def getOctave(s: String): Int = {
    if (s.endsWith("'''")) return 3
    if (s.endsWith("''")) return 2
    if (s.endsWith("'")) return 1
    if (s.endsWith(",,,")) return -3
    if (s.endsWith(",,")) return -2
    if (s.endsWith(",")) return -1
    return 0
  }

}

