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
d1:min s4 f d4:min  f bes
}

voiceA = \relative c'{
\clef "treble"
\key d \minor
\time 3/4

\repeat volta 2 { f4 f8 f f f }
\alternative {
  {d4 c8 d f4}
  {d4 c8 d bes4 \bar"|."}
}
}
lyricA = \lyricmode {
Tev pa -- tei -- ca -- mies, Kungs, mū -- su Dievs! Kungs, mū -- su Dievs!
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