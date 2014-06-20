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
a1:min e:min a:min e:min
b:min e:min b:min e:min
e2:min d g a:min6 e1:min
}

voiceA = \relative c'' {
\clef "treble"
\key e \minor
\time 4/4

a2^\markup {\translate #'(-10 . 0) \italic Refrēns } a4 b | g4. fis8 g4 e | a2 a4 b | g1 |
fis2 fis4 fis | e2. r8 e | fis4. a8 g4 fis | e1 \bar"||" \break

\repeat volta 2 {e4 e fis8 fis fis fis | g g g g fis fis fis e | e1 }
}

lyricA = \lyricmode {
Ja vien tu zi -- nā -- tu, ko grib dot tev Dievs,
lūg -- tu tad tu, un Viņš tev do -- tu dzert.
\set stanza = "1. "
Kungs mūs mī -- lē -- ja un sa -- vu dzī -- vi at -- de -- va par mums.
}
lyricB = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _ _ _
Vi -- ņa nā -- ve uz -- va -- rē -- ja grē -- ku un dod dzī -- vī -- bu.
}
fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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


