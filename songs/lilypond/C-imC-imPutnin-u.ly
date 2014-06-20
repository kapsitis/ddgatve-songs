\version "2.13.16"
%\header {
%    title = "Čim, čim, putniņu"
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
\key c \major
\time 2/4
\phrasingSlurDashed
f8 f16\([ f\)] f8 c16 c |
e8 d16 c d8 d |
\phrasingSlurDashed
f8 f16 f f8 c16\( c\) |
e8 d16 c d8 d |
\bar "|."
} 


lyricA = \lyricmode {
Čim, čim put -- ni -- ņu, čim put -- na bēr -- niņ! Ie -- lai -- dze krū -- mi -- ņā, tur ta -- va mui -- žiņ'.
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



