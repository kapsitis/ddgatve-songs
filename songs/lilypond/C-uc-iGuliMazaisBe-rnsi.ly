\version "2.13.16"
%\header {
%    title = "Čuči, guli, mazais bērnsi"
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

voiceA = \relative c' {
\clef "treble"
\key c \major
\repeat volta 2 {
\time 2/4
c8 c e e |
\time 3/4
g8 g g4 g8 r | 
\time 2/4
g8 g g d | 
\time 3/4
f8 g e4 e8 r
}
} 

lyricA = \lyricmode {
Ču -- či, gu -- li, ma -- zais bērn -- si
kā pe -- lī -- te mi -- dzi -- ņā -- i.
} 

fullScore = <<
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


