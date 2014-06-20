\version "2.13.16"
%\header {
%    title = "Juku, juku, sīki putni"
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
\key d \major
\time 2/4
\repeat volta 2 {
a'8 a a b | a8 fis fis fis | 
g8 e e e | d8 d d4
}
\repeat volta 2 {
e8 e e e | fis8 fis fis fis |
g8 e e e | d8 d d4
}
} 

lyricA = \lyricmode {
Ju -- ku, ju -- ku, sī -- ki put -- ni, li -- du, li -- du va -- na -- dziņ'. 
Ššš mu -- ši -- ņas, ššš o -- di -- ņi, trr res -- nie -- i dun -- du -- riņ'.
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



