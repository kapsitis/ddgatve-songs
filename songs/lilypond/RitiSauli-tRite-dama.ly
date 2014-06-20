\version "2.13.16"
%\header {
%    title = "Riti saulīt ritēdama",AA lapas, Jāņi
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
\time 3/4
\repeat volta 2 {
g8 g c4 c |
e8 c d4 d |
f8 a g4 e |
f16[ e] d8 c2 |
}
} 

lyricA = \lyricmode {
Ri -- ti, sau -- līt, ri -- tē -- da -- ma, zel -- ta za -- riem za -- ro -- dam. 
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


