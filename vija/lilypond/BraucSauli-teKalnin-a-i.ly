\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Brauc Saulīte kalniņāi
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key d \major
\time 2/4
d8 d a a |
d8 b a a |
d4 a' |
e8[ f] g4 |
f8 f e e |
d8 b a a |
f4( e) |
d2 |
\bar "|."
}


voiceB = \relative c' {
\clef "treble"
\key d \major
\time 2/4
s2 |
s2 |
d4 f |
e8[ d] e4 |
d8 d c a |
b8 g f a |
a2 |
d2 |
\bar "|."
}


lyricA = \lyricmode {
Brauc Sau -- lī -- te kal -- ni -- ņā -- i, lī -- go, lī -- go, zel -- tī -- tie -- mi ku -- me -- ļie -- mi, lī -- go. 
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\lyricsto "voiceA" \new Lyrics \lyricB
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


