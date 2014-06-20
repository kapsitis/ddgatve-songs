\version "2.13.16"
%\header {
%    title = "O kano žali sodai"
%}
% "Skamba, skamba kankliai, 1993"
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
\time 3/4
g'8 b d4 e8 e | d4 b2 
\repeat volta 2 {
\time 2/4
d8 d c4 | b8 b a g | b8 b c c | d4 b 
}
} 

lyricA = \lyricmode {
O ka -- no ža -- li so -- dai, 
o ka -- no ža -- li so -- dai, ža -- li jo -- va -- rė -- liai?
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 3/4 
g'8 g g4 c8 c | b4 g2
\repeat volta 2 {
\time 2/4
b8 b a4 | g8 g d d | g8 g a a | b4 g
} 
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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


