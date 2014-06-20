\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Kur Saulīte kavējiesi
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 3/4
c8 d e4 e |
f8 e e[ d] d4 |
d8 e f4 a |
g8 f e2 |
g8 g c4 b |
a8 b c4 e, |
d8 f a4 g | 
f8 d c2 |
\bar "|."
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 3/4
s2 s4 |
s2 s4 |
s2 f4 |
e8 d c2 |
e8 e e4 e |
f8 f f4 c |
d8 d d4 c |
d8 d c2
\bar "|."
}


lyricA = \lyricmode {
Kur, Sau -- lī -- te, ka -- vē -- jie -- si, kad tu ag -- ri ne -- te -- cēj';
kur, Sau -- lī -- te, ka -- vē -- jie -- si, kad tu ag -- ri ne -- te -- cēj'.
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


