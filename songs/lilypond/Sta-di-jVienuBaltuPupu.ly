\version "2.13.16"
%\header {
%    title = "Stādīj vienu baltu pupu"
%}
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


voiceA = \relative c' {
\clef "treble"
\key d \minor
\time 2/4
f8 a f g |
g8 g16[ f] e8 d |
d8 f d f |
g8 g g[ f] |
a8. g16 f8 g |
a8 g16[ f] e8 d |
 d8 f d f |
 g8 g g4 |
\bar "|."
} 


lyricA = \lyricmode {
Stā -- dīj vie -- nu bal -- tu pu -- pu bal -- tā smil -- šu kal -- ni -- ņā,
stā -- dīj vie -- nu bal -- tu pu -- pu bal -- tā smil -- šu kal -- ni -- ņā.
} 


fullScore = <<
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
\markup { \with-color #(x11-color 'white) \sans \smaller "__" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}



