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
%%  \context { \ChordNames
%%     \override ChordName #'font-size = #-1
%%  } 
}

chordsA = \chordmode {
b1:min a g fis:min g2 fis1:min b2:min
d2 fis:min e:min a d fis:min g4 d a2
}

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 4/4

\repeat volta 2 {fis4^\markup { \translate #'( -10 . 0 ) \italic Refrēns } d fis8 fis fis g | e4 cis e8 e e fis }
\alternative {
  {d4 b d e | cis8 cis fis e fis4 (cis) }
  { d4 b cis8 cis cis d | fis2 \parenthesize b,_\markup {\italic (beigās) } }
}
\break
\repeat volta 2 { \partial 2
a'2 | a g8 a g fis | e4 e8 e d4 fis8 g | a4 a g fis | cis2 }
}

lyricA = \lyricmode {
Mā -- te, tu mūs kat -- ru zi -- ni, tu mūs kat -- ru mī -- li, e -- si no -- mo -- dā par mums!
Ta -- vā jau -- na gais -- ma aust. _
\set stanza = "1. "
Ma -- rij, iz -- re -- dzē -- tā jau -- na -- va, nāc, rā -- di mums _ ce - ļu!
}
lyricB = \lyricmode {
Ce -- ļā ce -- rī -- bu mums dā -- vā, pat -- vē -- ru -- mā
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
Ma -- rij, Die -- va tau -- tas mei -- ta, _ pie sa -- va Dē - la mūs ved!
}
lyricC = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
Ma -- rij, pa -- ze -- mī -- gā kal -- po -- ne, Pa -- sau -- lei iz -- lūdz mie - ru!
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


