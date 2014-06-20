\version "2.13.16"
%\header {
%    title = "Kur ļautiņi jūs bijāti"
%}
% bēres
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
\time 2/4 
c8 d e e |
e8 d c c |
c8 d e e |
f8 e e4 |
e8 d c c |
c8 c d4 |
d8 d d d |
\time 6/4 
c2 c d\fermata |
\time 2/4 
f8 f f f |
\time 6/4 
e2 e d\fermata |
\bar "|."
} 


voiceB = \relative c' {
\clef "treble"
\key a \minor 
\time 2/4 
s2 |
s2 |
s2 |
s2 |
s2 |
s2 |
s2 |
\time 6/4 
s2 s2 s2 |
\time 2/4 
d8 d d d |
\time 6/4 
c2 c d\fermata |
\bar "|." 
} 


vardiBalssA = \lyricmode {
Kur ļau -- ti -- ņi jūs bi -- jā -- ti smil -- šai -- nā -- mi kā -- ji -- ņām,
kur ļau -- ti -- ņi jūs bi -- jāt smil -- šai -- nā -- mi kā -- ji -- ņām, smil -- šai -- nā -- mi kā -- ji -- ņām?

}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \vardiBalssA
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


