\version "2.13.16"
%\header {
%    title = "Pele brauca, rati čīksta"
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
\repeat volta 2 {
e8 e f e | d8 c e c | e8 e f e | d8 c e4 |
e8 c e r | d8 c e r | e8 e f e | d8 c e4
}
} 

lyricA = \lyricmode {
Pe -- le brau -- ca, ra -- ti čīk -- sta, 
At -- ved mie -- ga ve -- zu -- miņ'. 
Ā -- ā -- ā, u -- cu -- cu, 
At -- ved mie -- ga ve -- zu -- miņ'. 
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


