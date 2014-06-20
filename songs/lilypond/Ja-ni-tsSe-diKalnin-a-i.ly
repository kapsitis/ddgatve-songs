\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Jānīts stāvēj kalnīnāji
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
c8 c e e |
g8 g e c |
f8[ a] a4 |
a8[ g] g4 |
g8 g f8 f |
e8 e d8 f |
e4 d |
g8[ f] e4 |
g8 g f8 f |
e8 e d8 f |
\time 4/4
e4 d2.
\bar "|."
}


voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
c8 c e e |
g8 g e c |
f4 f |
f8[ e] e4 |
e8 e d d |
c8 c b g |
c4 d |
e8[ d] c4 |
e8 e d d |
c8 c b g |
\time 4/4
c4 g2.
\bar "|."
}


lyricA = \lyricmode {
Jā -- nīts sē -- di' kal -- ni -- ņā -- i, lī -- gā, lī -- gā, Jā -- ņa bēr -- ni le -- ji -- ņā -- i, lī -- gā, lī -- gā,
Jā -- ņa bēr -- ni le -- ji -- ņā -- i, lī -- gā.
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\lyricsto "voiceB" \new Lyrics \lyricA
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


