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
d2:min g d1:min bes2 c f a:7 d:min g d1:min bes2 c d1:min
}

voiceA = \relative c''{
\clef "treble"
\key f \major
\time 4/4

a4. f8 g4. d8 | d2 r4 a' | d d c g | a2 r | a4. f8 g4. d8 | d2 r4 d | f f e c | d2. r4 \bar"|."
}

lyricA = \lyricmode {
Kun -- gam pa -- tei -- cos: sirds Vi -- ņā prie -- ku rod.
Kun -- gam pa -- tei -- cos par vi -- su, ko Viņš dod.
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