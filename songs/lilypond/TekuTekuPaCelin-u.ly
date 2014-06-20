\version "2.13.16"
% \header {
%    title = "Teku, teku pa celiņu"
% }
% Katrīna Riekstiņa, #56 (Iļģi)
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


voiceA = \relative c' {
\clef "treble"
\key a \minor
\time 4/4
d8 a d d d d c b | 
c4 a c a |
d8 a d d d f e d
\time 2/4
a4 a
\bar "|."
} 


lyricA = \lyricmode {
Te -- ku, te -- ku pa ce -- li -- ņu, lī -- go, lī -- go, 
Uz -- te -- cē -- ju zied -- u -- pī -- ti, lī -- go. 
}

chordsA = \chordmode {
\time 4/4
d1:m | a1:m | d1:m | 
\time 2/4
a2:m
}


fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
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


