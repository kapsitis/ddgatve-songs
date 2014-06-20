\version "2.13.16"
%\header {
%    title = "Es beju mameņai"
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
\key f \major
\time 4/4
\slurDashed
\repeat volta 2 {
f4 f8 g a4 a8( a) | g8 f e d c4 c8( c) | g'4 g8[ bes] a4 g 
}
\alternative { { c4 c c r } { f,4 f f r4 } }
\bar "|."
} 



lyricA = \lyricmode {
Es be -- ju ma -- me-ņai vī -- na po -- ša mei -- ti-ne,
Na -- zy-nu, kai -- du vei -- ru jimt. vei -- ru jimt.
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


