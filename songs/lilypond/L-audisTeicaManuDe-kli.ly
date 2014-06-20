\version "2.13.16"
%\header {
%    title = "Ļaudis teica manu Dēkli"
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
a8 a e'4. e8 |
f8 e d[ c16 b] a4 |
\time 2/4 
c8 c d d |
e8 c b a |
\time 3/4
c8\fermata g\fermata a2 |
\bar "|."
} 


lyricA = \lyricmode {
Ļau -- dis tei -- ca ma -- nu Dēk -- li ū -- de -- nī -- i no -- slī -- ku -- šu, no -- slī -- kuš'. 
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



