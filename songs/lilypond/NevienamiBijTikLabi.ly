\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Nevienami bij' tik labi"
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
\key a \minor
\time 12/8
\repeat volta 2 {
c'8 e4 d8 c4 d8 c4 e8 d4 | 
d8 c4 e8 d4 d8 c4 c4. |
} 
\repeat volta 2 {
a8 a4 c8 a4 c8 d4 c4. | 
d8 c4 e8 d4 d8 c4 c4. |
}
}


lyricA = \lyricmode {
Ne -- vie -- na -- mi bij tik la -- bi
Kā ma -- na -- mi bēr -- ni -- ņam. 
Ai -- jā, ai -- jā, ai -- jai -- jā,
Ai -- jā, ai -- jā, ai -- jai -- jā.   
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


