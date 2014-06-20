\version "2.13.16"
%\header {
%    title = "Adat, meitas, ko adati"
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
c8 c e c |
g'8 e e4 |
e8 e c f |
e8 d d4 |
f8 e d c |
\time 3/4
d4 e f8 e |
d8 c d2 |
\bar "|."
} 

lyricA = \lyricmode {
Šķir Pēr -- ko -- ni lie -- tus gais', de -- vi -- ņie -- mi ga -- ba -- liem; Šķir Pēr -- ko -- ni de -- vi -- ņie -- mi ga -- ba -- liem,
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



