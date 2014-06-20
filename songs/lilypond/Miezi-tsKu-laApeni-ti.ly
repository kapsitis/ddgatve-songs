\version "2.13.16"
%\header {
%    title = "Miezīts kūla apenīti",AA lapas, Jāņi
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
c8 c e f |
g8 g e c |
f4 a |
a4 g |
g8 g f f |
e8 d c d |
e4 d |
g8[ f] e4 |
g8 g f f |
e8 d c d |
e4 d |
d4 c |
\bar "|."
} 

lyricA = \lyricmode {
Mie -- zīts kū -- la a -- pe -- nī -- ti, lī -- go, lī -- go, aiz ma -- tie -- mi tu -- rē -- da -- mis, lī -- go, lī -- go,
aiz ma -- tie -- mi tu -- rē -- da -- mis, lī -- go, lī -- go!
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


