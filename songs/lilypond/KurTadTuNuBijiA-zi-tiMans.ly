\version "2.13.16"
%\header {
%    title = "Kur tad tu nu biji, āzīti mans"
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
g'8 g g g |
c4 g |
a4 c8 a |
g2 |
\repeat volta 2 {
\slurDashed
f8 f f[( f]) |
\slurDashed
e8 e e[( e]) |
d4 d8 d|
}
\alternative { { c4 g'8^> r | } {c,4 r | } }
} 

lyricA = \lyricmode {
Kur tad tu nu bi -- ji, ā -- zī -- ti mans? 
Sud -- ma -- lās, sud -- ma -- lās, kun -- dzi -- ņu ma -- nu,  man'!
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


