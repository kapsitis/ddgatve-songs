\version "2.13.16"
%\header {
%    title = "Jānīšami pavaicāju"
%}
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


voiceA = \transpose d a { \relative c' {
\clef "treble"
\key d \minor
\time 2/4
d8^"runājoši, mierīgi" f d f | e8 d c bes 
\repeat volta 2 {
\time 3/4
a4 a'2 | g8[ bes8] a2 | 
\time 2/4
g8 f bes a | g8 f e f 
\time 3/4
c4 d2
}
}
}



lyricA = \lyricmode {
Jā -- nī -- ša -- mi pa -- vai -- cā -- ju, lī -- go, lī -- go, 
kā -- du zā -- li pir -- mo rau -- ti, lī -- go. 
}

chordsA = \chordmode {
\time 2/4
a2:m | a2:m |
\repeat volta 2 {
\time 3/4
e2.:m | g4:5 a2:m |
\time 2/4
g2:5 | a2:m |
\time 3/4
g4:5 a2:m |
}
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
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


