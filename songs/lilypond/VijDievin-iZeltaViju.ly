\version "2.13.16"
% \header {
%    title = "Vienu rudzīti nominu"
% }
% Katrīna Riekstiņa, #58 (Grodi)
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
\key e \major
\time 6/4
b8 b e fis gis4 fis8[ gis] e4. fis8 | 
gis8 gis fis gis a4 gis8[ fis] fis4 fis | 
a8 gis fis a gis4 fis8[ e] e2\fermata
\bar "|."
} 


lyricA = \lyricmode {
Vij, Die -- vi -- ņi, zel -- ta vi -- ju 
Vis -- ga -- rā -- mi jū -- ras ma -- lu, 
Vis -- ga -- rā -- mi jū -- ras mal'. 
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
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


