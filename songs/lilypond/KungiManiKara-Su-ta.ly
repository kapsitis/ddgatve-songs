\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kungi mani karā sūta",AA lapas, karavīru
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
\time 3/4
d8 c d4 d |
c8 e e8[ c] c4 |
d8 c d4 d |
c8 e e8[ c] c4 |
d8 c d4 d |
a8[ f' e] d8 c c |
d8 c d4 d |
\time 4/4
a8[ f' e] d8 c2 |
\bar "|."
} 

lyricA = \lyricmode {
Kun -- gi ma -- ni ka -- rā sū -- ta, kun -- gi ma -- ni ka -- rā sū -- ta,
ar to le -- dus zo -- ben -- ti -- ņu, ar to le -- dus zo -- ben -- tiņ'.
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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


