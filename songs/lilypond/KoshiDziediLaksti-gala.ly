\version "2.13.16"
%\header {
%    title = "Koši dziedi lakstīgala",AA lapas, 
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
c8 c c e |
g8 g f f |
\time 4/4
\times 2/3 { e8[ f e] } d4 c c|
\time 2/4
f8 e d c |
\time 4/4
g4 d' c4. g'8 |
\time 2/4
f8 e d c |
\time 4/4
g4 d' c2 |
\bar "|."
} 

lyricA = \lyricmode {
Ko -- ši dzie -- di lak -- stī -- ga -- la, lak -- stī -- ga -- la, 
Vāc -- ze -- mē -- i kār -- klie -- nā -- i, Vāc -- ze -- mē -- i kār -- klie -- nā.
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


