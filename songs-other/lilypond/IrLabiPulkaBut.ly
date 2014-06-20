\version "2.13.16"
%\header {
%    title = "Ir labi pulkā būt"
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
\clef treble
\key g\major
\time 4/4  \tempo 4=76
\partial 8*3 
d8 e d | b'8 b b4 s8 d, e d | 
b'8 b b4 s4 b | a4 c b a 
\time 2/4 
g2 
\repeat volta 2 {
\time 4/4
s4 g g e' | d4. c8 b2 | 
s4 b a c | b4 a g2 
}
}


voiceB = \relative c' {
\time 4/4   
\partial 8*3 
d8 e d | g8 g g4 r8 d e d | 
g8 g g4 r4 g4 | fis4 a g fis 
\time 2/4 
g2 
\repeat volta 2 {
\time 4/4
r4 g g c | b4. a8 g2 | 
r4 g fis a | g fis g2 
}
}


lyricA = \lyricmode {
Ir la -- bi pul -- kā būt, 
ir la -- bi pul -- kā būt 
pie la -- biem cil -- vē -- kiem.
Tur rai -- ta va -- lo -- da 
un jaut -- ras dzies -- mas skan. 
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


