\version "2.13.16"
%\header {
%    title = "Pele brauca vāģi čīksta",AA lapas
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
\key g \major
\time 2/4
d8 d d d |
e8 d d d |
c8 a c c |
d8 c b4 |
g8 b b b |
\slurDashed
c8 b a( a) |
fis8 a a a |
b8 a g4 |
} 

lyricA = \lyricmode {
Pe -- le brau -- ca, vā -- ģi čīk -- sta, lie -- lu mie -- ga ve -- zu -- miņ',
pe -- le brau -- ca, vā -- ģi čīkst, lie -- lu mie -- ga ve -- zu -- miņ'.
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


