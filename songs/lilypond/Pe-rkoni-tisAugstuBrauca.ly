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
\phrasingSlurDashed
\phrasingSlurDown
f8 f e8. e16 |
f8 f e8.\( e16\)|
f8 f g8. f16 |
g8 e d4 |
d8 c d d |
c8 c d4 |
\bar "|."
} 

lyricA = \lyricmode {
Pēr -- ko -- nī -- tis aug -- stu brau -- ca, dzel -- žiem kal -- ti ku -- me -- liņ', dzel -- žiem kal -- ti ku -- me -- liņ'.
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



