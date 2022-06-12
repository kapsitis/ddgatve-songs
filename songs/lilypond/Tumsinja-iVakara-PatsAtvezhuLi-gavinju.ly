\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Tumsiņāi,vakarā",AA lapas,
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
c8 e16[ f] g8 g |
c8 c16[ b] a4 |
a8 b c c |
g2 |
e8 g a g |
f8 e d c |
d8 a' g b,|
c2 | 
\bar "|."
} 

lyricA = \lyricmode {
Tum -- si -- ņā -- i, va -- ka -- rā, ei -- jā, va -- ka -- rā,
pats at -- ve -- žu lī -- ga -- vi -- ņu, ei -- jā, lī -- ga -- viņ'.  
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


