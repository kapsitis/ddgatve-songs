\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Tumšas naktis, zaļa zāle",AA lapas, 
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
\key a \minor
\time 4/4
a4 c8[ f] e4. d8 |
c4 d a8[ g] a4 |
a4 c8[ a'] a4( g8) f |
e4 e8[ a] g4( a8) e |
f8[ e] d4 e4. d8 |
c4d a8[ g] a4 |
a4 c8[ f] e4. d8 |
c8[ b] d4 a2 |
\bar "|."
} 

lyricA = \lyricmode {
Tum -- šas nak -- tis, za -- ļa zā -- le, lau -- kā lai -- du ku -- me -- li -- ņu; 
tum -- šas nak -- tis, za -- ļa zā -- le, lau -- kā lai -- du ku -- me -- liņ'
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


