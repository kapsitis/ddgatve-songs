\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Rāmi, rāmi padziedāju
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
g'8 g g f |
g8 e d c |
d8 g g f |
g8 e d c |
g'4 g8[ f] |
e4 d |
g8 g f g |
e2 |
\bar "|."
}


voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
e8 e d d |
c8 c g g |
d'8 e d d |
c8 c g g |
e'4 d |
c4 g |
e'8 e d d |
c2 |
\bar "|."
}


lyricA = \lyricmode {
Rā -- mi, rā -- mi pa -- dzie -- dā -- ju bez Sau -- lī -- tes va -- ka -- rā -- i,
rai -- rai -- rai -- rā ai -- rai -- ral -- lal -- lā!
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceB" \lyricA
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


