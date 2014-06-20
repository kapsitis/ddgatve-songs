\version "2.13.16"
%\header {
%    title = "Baltus zirgus nejūdzati"
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
\time 3/4
c8 a c4 e |
e8 c d8[ c] e4 |
c8 a c4 e |
\time 4/4
b4 c8[ b] a2 |
\repeat volta 2 {
\time 3/4
a'8 g a4 e |
g8 f e4 d |
c8 a c4 e |
\time 4/4
b4 c8[ b] a2 |
}
} 

lyricA = \lyricmode {
Bal -- tus zir -- gus ne -- jū -- dza -- ti, ve -- dot ma -- ni kal -- ni -- ņā,
tā -- lu spī -- dēj bal -- ti zir -- gi gau -- ži rau -- dāj pa -- li -- cēj'.
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


