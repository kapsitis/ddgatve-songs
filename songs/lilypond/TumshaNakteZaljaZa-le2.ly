\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Tumša nakte, zaļa zāle2 "
%}
% AA Lapas , Ūsiņš, Darba dz.
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
\key f \major
\time 2/4
f8 f a a | 
g8 g f16[ e] d8 |
c8 c d16[ c] bes8 |
d8 c c4 |
f4 c |
a'8 a g4 |
f8 f e16[ d] c8 |
d8 c c4 |
\bar "|."
} 




lyricA = \lyricmode {
Tum -- ša nak -- te za -- ļa zā -- le, 
lau -- kā lai -- du ku -- me -- liņ',
trā -- rā, ral -- lal -- lā, 
lau -- kā lai -- du ku -- me -- liņ'.
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



