\version "2.13.16"
%\header {
%    title = "Pelīte brauca, ratiņi čīksta"
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
\time 6/8
\repeat volta 2 {
g'8 g g c c4 | b8 b c d4\fermata d8 | 
g,8 g g c d4 | ees8 d b c4\fermata c8 |
ees8 c4 b8 c4 | d8 c( b) c4\fermata c8 |
d8 f4 e8 d4 | e8 d( b) c4\fermata c8 |
}
} 

lyricA = \lyricmode {
Pe -- lī -- te brau -- ca, ra -- ti -- ņi čīk -- sta, 
Pe -- lī -- te brau -- ca, ra -- ti -- ņi čīk -- sta.
Ve -- da mie -- ga ve -- zu -- mī -- nu, 
Ve -- da mie -- ga ve -- zu -- mī -- nu.
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


