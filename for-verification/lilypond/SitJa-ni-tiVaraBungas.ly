\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Sit Jānīti vara bungas
\layout {
indent = #0
ragged-last = ##f
}




voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
g'8 e e e |
g8 e e e |
f8 d d f |
e8 c c e |
d4 d8[ c] |
b8[ a] g4 |
\time 3/4
f'4. f8 a a |
\time 2/4
g8 g g g |
g4 g8[ f] |
\time 3/4
e8[ d] c2 |
\bar "|."
}



voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
s2 |
s2 |
s2 |
s2 |
s2 |
s2 |
\time 3/4
s2 f8 f |
\time 2/4
e8 e e e |
e4 e8[ d] |
\time 3/4
c8[ b] c2 |
\bar "|."
}


lyricA = \lyricmode {
Sit Jā -- nī -- ti va -- ra bun -- gas 
vār -- tu sta -- ba ga -- li -- ņā -- i, 
lī -- go, lī -- go, 
vār -- tu sta -- ba ga -- li -- ņā -- i, 
lī -- go, lī -- go!
}





fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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

