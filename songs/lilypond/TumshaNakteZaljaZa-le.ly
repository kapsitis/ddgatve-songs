\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Tumša nakte, zaļa zāle"
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
\key c \major
\time 3/4
d4 f e8 d |
c8 a d4 a |
d4 f e8 d |
c8 c d4 a |
a'4 a g8 f |
e8 f g4. e8 |
a4 a f8 e |
d8 c d2  
\bar "|."
} 




lyricA = \lyricmode {
Tum -- ša nak -- te za -- ļa zā -- le, tum -- ša nak -- te za -- ļa zā -- le, 
lau -- kā lai -- du ku -- me -- li -- ņu, lau -- kā lai -- du ku -- me -- liņ'.
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



