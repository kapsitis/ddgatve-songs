\version "2.13.16"
%\header {
%    title = "Es izjāju prūšu zemi"
%}
% http://www.youtube.com/watch?v=XvALtGanrRI
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
\key a \major
\time 6/8
\slurDashed
\repeat volta 2 {
a'8 a a[ gis] a[ gis] | fis8 fis fis[ e] d4 | a'8 cis b4 e, 
}
\alternative { { cis'8 b16[ a] a4 b8[ gis] } { cis8 b16[ a] a2 } } 
} 



lyricA = \lyricmode {
Es iz -- jā -- ju prū -- šu ze -- mi kok -- lē -- da -- mis, spē -- lē -- da -- mis,
spē -- lē -- dams. 
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


