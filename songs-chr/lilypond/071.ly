\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}

\layout {
indent = #0
ragged-last = ##f
}

chordsA = \chordmode {
\set majorSevenSymbol = \markup { maj7 }
s8 c2:min bes es1 f2:min f:min6 g1 s4 as2 f:min6 es1:maj f2:min f:min6 g2. s4 g2
c2:min as bes g:min c:min f:min f:min6 g c:min as f:min6 g:min es:maj f:min f:min6 c2.:min
}

voiceA = \relative c' {
\clef "treble"
\key c \minor
\time 4/4
\partial 8

c8 \bar"||" g'4 g8 f g as bes c | g2. f8 g | as4. as8 bes4 c | g2. s4
\repeat volta 2 { \partial 4 r8 g \bar"||" c4 c8 c d es d c | bes2. r8 as | as4. as8 as as bes c }
\alternative {
  { g2. s4}
  { g2 r8 c c bes \bar"||" }
}
c4 c bes8 as g as | bes2 r8 es, as g | as4. bes8 c bes as f | g2 r8 g c bes |
c4 c d8 es d c | bes2 bes4 g8 g | f4 f8 f f f g as | c2 c4^\markup {\italic Fine} \bar"||" r8 c,^\markup {\italic D.C.}
}

lyricA = \lyricmode {
Mans Dievs, ne -- aiz -- mir -- sti ma -- ni Tu, Ta -- vu bal -- si klau -- sī -- šu.
Mans Dievs, Ta -- vu Krus -- tu mī -- lu es. Mans Dievs, es dzī -- vo -- ju tik Tev. Tev.
\set stanza = "1. " Pat a -- rī put -- ni at -- rod māj -- vie -- tu, bet cil -- vēks mek -- lē Die -- va val -- stī -- bu.
Mans prieks ir dzī -- vot Ta -- vā žē -- las -- tī -- bā, kvē -- lu lūg - ša -- nu no sirds Tev vel -- tīt. Mans...
}
lyricB = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
\set stanza = "2. "
Man stai -- gā -- jot šai bē -- du ie -- le  -- jā, Tu dā -- vā -- ji man vel -- dzes a -- vo -- tu,
lai ie -- tu es šai dzī -- ves ce -- ļā aug -- šup, Kun -- ga vai - gu ska -- tī -- tu es cie -- nīgs. Mans...
}
lyricC = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
\set stanza = "3. "
Ar Te -- vi, Kungs, ir vēr -- tī -- gā -- ka diena man ne -- kā tūk -- stoš ci -- tas vie -- nat -- nē. 
Dievs Sa -- ba -- ot, es pa -- ļau -- jos uz Te -- vi, ak, mans Dievs, mī -- lu Ta -- vu svēt -- nī -- cu.
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
\lyricsto "voiceA" \new Lyrics \lyricC
>>
}
>>


\score {
\fullScore
\header { piece = "__" opus = "__" }
}
\markup { \with-color #(x11-color 'white) \sans \smaller "aaa" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}


