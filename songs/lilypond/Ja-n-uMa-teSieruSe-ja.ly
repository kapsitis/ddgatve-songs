\version "2.13.16"
%\header {
%    title = "Jāņu māte sieru sēja",AA lapas, Jāņi
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
\time 4/4
d8 d d e f e d f |
a,4 a a a |
d8 d d e f e d f |
a4 a a a |
f8 f f a c c bes a |
g4 c, c c |
g'8 g g a g f e f |
d4 d d d |
\bar "|."
} 

lyricA = \lyricmode {
Jā -- ņu mā -- te sie -- ru sē -- ja, lī -- go, lī -- go, 
de -- vi -- ņie -- mi stū -- rī -- šie -- mi, lī -- go, lī -- go,
es ne -- va -- ru at -- mi -- nē -- ti, lī -- go, lī -- go, 
ka -- pēc tie -- ši de -- vi -- ņie -- mi, lī -- go, lī -- go.
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


