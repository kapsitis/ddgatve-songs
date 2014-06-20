\version "2.13.16"
%\header {
%    title = "Lai bij' vārdi, kam bij' vārdi"
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


voiceA = \transpose d a { \relative c' {
\clef "treble"
\key d \minor
\time 2/4
\repeat volta 2 {
f8 e d a | d8 d g g | f8 g f d | d8 c
}
\alternative { { a\( a\)} { d\( d\)} }
} }

lyricA = \lyricmode {
Lai bij' vār -- di, kam bij' vār -- di, 
man pa -- ša -- mi stip -- ri vār -- di. 
vār -- di.
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


