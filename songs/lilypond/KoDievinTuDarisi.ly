\version "2.13.16"
%\header {
%    title = "Ko, Dieviņ, tu darīsi"
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


voiceA = \relative c'' {
\time 2/4
\clef "treble"
\key g \major
d8.^"Viens, ātri" d16 d8 c |
c8 b b c |
d8. d16 d8 c |
b8^"Lēnāk" a g[( a)] 
\time 3/4
b8 b b[( a)] g4 |
c8 c c[( b)] a4 |
d8 d d[( b)] d[( b)] |
a8 a g2
\bar "|."
} 

lyricA = \lyricmode {
Ko, Die -- vi -- ņi, tu da -- rī -- si, Kad mēs vi -- si no -- mir -- sam?
Ko, Die -- vi -- ņi, tu da -- rī -- si, Kad mēs vi -- si no -- mir -- sam?
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



