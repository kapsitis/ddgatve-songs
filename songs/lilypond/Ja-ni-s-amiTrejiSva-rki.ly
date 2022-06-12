\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Jānīšami treji svārki
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
c8 e e16[ d] e8 |
f8 e e d |
c8[ e] g4 |
f8[ g] e4 |
\repeat volta 2 {
g8 g g g |
a8 g g f |
e8[ d] g4 |
f8[ g] e4 |
}
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
s2 |
s2 |
c4 e4 |
d8[ e] c4 |
\repeat volta 2 {
e8 e e e |
f8 e e d |
c8[ b] c4 |
b8[ c] c4 |
}
}


lyricA = \lyricmode {
Jā -- nī -- ša -- mi tre -- ji svār -- ki, lī -- go, lī -- go, 
vi -- si tre -- ji mu -- gu -- rā -- i, lī -- go, lī -- go.
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceA" \lyricA
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


