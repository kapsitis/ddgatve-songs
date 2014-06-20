\version "2.13.16"
%\header {
%    title = "Ganos gāju kreklu šuvu",AA lapas, 
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
f8 e f e |
g8 f f d |
d8 g f e |
f8 e d4\fermata |
c2 |
d8 g f e |
f8 e d4\fermata |
\bar "|."
} 

lyricA = \lyricmode {
Ga -- nos gā -- ju krek -- lu šu -- vu, 
pie o -- zo -- la mē -- rī -- dam', ē, 
pie o -- zo -- la mē -- rī -- dam'
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


