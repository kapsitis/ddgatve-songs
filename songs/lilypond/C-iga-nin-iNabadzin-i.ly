\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Čigāniņi, nabadziņi
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key d \minor
\time 2/4
\phrasingSlurDashed
\phrasingSlurDown
%MS
g'8 g g g |
g8 d d\( d\) |
g8 g g g |
g8 f d4 |
%ME
f8 e d4\fermata |
g8 g g g |
g8 d d\( d\) |
g8 g g g |
g8 f d4 |
f8 e d4\fermata |
\bar "|."
}


voiceB = \relative c' {
\clef "treble"
\key d \minor
\time 2/4
s2 |
s2 | 
s2 |
s2 |
s2 | 
c8 c c c |
c8 d d d |
c8 c c c |
c8 d d4 |
d8 c d4 |
\bar "|."
}


lyricA = \lyricmode {
Či -- gā -- ni -- ņi, na -- ba -- dzi -- ņi pa pa -- sau -- li va -- zā -- jās, ka -- la -- do,
či -- gā -- ni -- ņi, na -- ba -- dzi -- ņi pa pa -- sau -- li va -- zā -- jās, ka -- la -- do!
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


