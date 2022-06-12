\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Liec, Laimiņa, man mūžiņu"
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
\key fis \major
\time 3/4
fis4 gis fis8 eis 
\time 2/4
fis8 fis gis fis | gis8 gis fis eis |
fis8 fis gis cis, | fis8 fis b gis |
b8 ais gis4 | b8 b b ais |
gis8 ais gis ais | fis8 b b ais |
b8 ais gis4
\bar "|."
} 

lyricA = \lyricmode {
Liec, Lai -- mi -- ņa, man mū -- ži -- ņu, 
Vieg -- lu, vieg -- lu, kup -- lu, kup -- lu,
Liec, Lai -- mi -- ņa, man mū -- žiņ',
Vieg -- lu, vieg -- lu, kup -- lu, kup -- lu,
Vieg -- lu, vieg -- lu, kup -- lu, kupl'.
}

voiceB = \relative c' {
\clef "treble"
\key fis \major
\time 3/4
s2.
\time 2/4
s2 | s2 | s2 | s4 gis'8 fis |
gis8 fis gis4 | gis8 gis gis fis |
gis8 fis gis fis | fis8 gis gis fis |
gis8 fis gis4
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



