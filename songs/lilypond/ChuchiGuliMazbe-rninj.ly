\version "2.13.16"
%\header {
%    title = "Čuči, guli mazbērniņ",AA lapas, Šūpuļdziesmas
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
\repeat volta 2 { 
f8 f f d |
e8 e e4 |
d8 d d8. b16 |
d8 c c4 
}
} 

lyricA = \lyricmode {
Ču -- či, gu -- li maz -- bēr -- niņ, es te -- cē -- šu pu -- ķes plūkt'
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


