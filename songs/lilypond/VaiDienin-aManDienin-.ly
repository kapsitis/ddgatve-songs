\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas, bēres
% Vai dieniņa man dieniņ', tu atnāci nezinām'
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key a \minor
\time 2/4
e8^\markup{Viena} e e e |
\slurDashed
\slurDown
e8 d c( c) |
e8 e e e |
e8 d c4\fermata |
e8^\markup{Visas smagi} d b b |
c8 b c4 |
d8 e e e |
e8 d c4 |
d8 e e e |
\time 6/4 
e2 d c |
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
b8 c c c |
c8 b c4 |
b8 c c c |
c1. |
\bar "|."
}


lyricA = \lyricmode {
Vai die -- ni -- ņa man die -- niņ', tu at -- nā -- ci ne -- zi -- nām',
vai die -- ni -- ņa man die -- niņ', tu at -- nā -- ci ne -- zi -- nām',
tu at -- nā -- ci ne -- zi -- nām'!
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


