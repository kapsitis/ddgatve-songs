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
g2 d e:min b:7 c d g d c g
}

voiceA = \relative c''{
\clef "treble"
\key g \major
\time 2/4

\repeat volta 2 {b4 b | a b8 a | g4 g8 g | fis g a b | e,4 e8 e | fis4 (g8 [a]) } 
\alternative {
  { b2 (| a) }
  { g2~ | g \bar"|." }
}
}

lyricA = \lyricmode {
Jē -- zus Kris -- tus ir Kungs Die -- va Tē -- va go -- dī -- bā. Al -- le -- lu -- ja. -ja.
}


fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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