\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Meitas mani melli sauca"
%}
% Budēlīši, p.101
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
\time 2/4
b'8 b gis e | e'8 e cis a | cis8 cis e cis | b2 | 
a8 a cis cis | gis8 gis b b | fis8 fis16[ gis] a8 a | e8[ gis b e] |
a,8 a cis cis | gis8 gis b b | fis8 fis16[ gis] a8 a | e2
\bar "|." 
} 

lyricA = \lyricmode {
Mei -- tas ma -- ni mel -- li sau -- ca, ak, vai, vai, vai, vai! 
Redz man mel -- lu ku -- me -- li -- ņu, ak, vai, vai, vai, vai! 
Redz man mel -- lu ku -- me -- li -- ņu, ak, vai, vai, vai, vai!
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


