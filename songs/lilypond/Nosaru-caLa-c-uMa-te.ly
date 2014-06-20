\version "2.13.16"
%\header {
%    title = "Nosarūca lāču māte",AA lapas, Šūpuļdziesmas
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
\time 3/4
g4 a8[ g] f e |
d4 d d8[ e] |
f4 g8[ f] e d |
g4 d g8 f |
e8 d c4. d8 |
g4 d g8[ f] |
\time 4/4
e4 d c2 | 
\bar "|."
} 

lyricA = \lyricmode {
No -- sa -- rū -- ca lā -- ču mā -- te, mei -- ti -- ņai pie -- dzim -- sto -- ti; 
No -- sa -- rū -- ca lā -- ču mā -- te, mei -- ti -- ņai pie -- dzim -- stot.
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


