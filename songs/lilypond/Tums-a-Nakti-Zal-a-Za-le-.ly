\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Tumšā naktī, zaļā zālē"
%}
% AA Lapas "Darba dz.", Ūsiņš
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
\time 2/4
a8 e' e d16[ c] |
b8 c16[ b] a8 a |
a8 a' a g16[ f] |
e8 a g f16[ e] |
d8 d e d16[ c] |
b8 c16[ b] a8 b |
c8 d e d16[ c] |
b8 c16[ b] a4 |
\bar "|."
} 

chordsA = \chordmode {
\time 2/4 a2:m | d4:m a4:m | a8:m f4.:5 | c8:5 f8:5 c4:5 | d4:m a4:m | d4:m a8:m g8:5 | c8:5 d8:m a4:m | e4:m a4:m
}


lyricA = \lyricmode {
Tum -- šā nak -- tī, za -- ļā zā -- lē lau -- kā lai -- žu ku -- me -- li -- ņu;
Tum -- šā nak -- tī, za -- ļā zā -- lē lau -- kā lai -- žu ku -- me -- liņ.
}

fullScore = <<
\new ChordNames { \chordsA }
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



