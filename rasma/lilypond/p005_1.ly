\version "2.13.16"
%\header {
%    title = "1a"
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

voiceB = \relative c' {
\clef "treble"
\key a \minor
\time 4/4
s1|
s1| 
s1|
s2 e'2 |
\break
s1|
s1|
s1|
a4. a8 a2 |
\bar "|."
} 

voiceA = \relative c' {
\clef "treble"
\key a \minor
\time 4/4
c'4 a c( b8) a|
b4 g g e| 
c'4 e g( f8) e |
\voiceTwo
d4 g e8( [d ] c)[b ] |
\oneVoice
\break
a4 a e'( d8) c |
b4 g g e |
a8 [b ] c [d ] e4 e |
\voiceTwo
a,4. a8 a2 |
\bar "|."
} 

lyricA = \lyricmode {
Ko kun -- dzi -- ņi tu do -- mā -- ji uz zo -- be -- na at -- spie -- dies?
Ko kun -- dzi -- ņi tu do -- mā -- ji uz zo -- be -- na at -- spie -- dies?
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\new Voice = "voiceB" { \voiceOne \autoBeamOff \voiceB }
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


