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
\key d \major
\time 4/4
e4 g8[ fis] e4 d8[ e] |
fis4 fis fis e8[ fis] |
g4 g g8[ fis] e4 |
fis4 fis fis8[ e] fis |
g4. fis8 g4 fis8 e |
fis4 fis8 e fis4 e8 fis |
g2 e |
fis1 |
\bar "|."
}


voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
s1 |
d4 d d cis8[ b] |
a4 e, e8[ d] cis4 |
d4 d d8[ cis] b4 |
a4. a8 a4 a8 a |
d4 d8 a d4 cis8 d4 |
e2 cis |
d1 | 
\bar "|."
}


lyricA = \lyricmode {
Jā -- nīts stā -- vēj' kal -- nī -- nā -- ji, lī -- go, lī -- go, zā -- ļu nas -- ta mu -- gu -- rā -- i, lī -- go!
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


