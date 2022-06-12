\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Pār puriem, pār mežiem"
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


voiceA = \relative c'' {
\clef "treble"
\key c \major
\time 2/4
g8 e' c g |
a8( g16) f e8 c |
f8( g16) f e8 g |
d8 d c4 |
c'8 e16[ c] b8 d |
a8 a g4\fermata
\bar "|."
} 

lyricA = \lyricmode {
Pār pu -- rie -- mi, pār me -- žie -- mi 
O -- zols kri -- ta ska -- nē -- dams,
O -- zols kri -- ta ska -- nē -- dams.
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
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



