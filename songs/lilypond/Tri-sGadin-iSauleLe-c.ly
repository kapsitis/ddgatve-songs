\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Trīs gadiņi Saule lēc'",AA lapas, Jāņi
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
\key d \minor
\time 2/4
f8 d d4 |
e8 d c4 |
c8 d e e |
\time 3/4
f8 d e4. d8 |
\time 2/4
e8 d c c |
c8c d4 |
d8 e d d |
d8 c d4 |
d8 c d d |
\time 4/4
d2 e |
d1 |
\bar "|."
} 

lyricA = \lyricmode {
Trīs ga -- diņ' Sau -- le lēc' zelt -- o -- zo -- la ga -- li -- ņā -- i;
trīs ga -- di -- ņi Sau -- le lēc' zelt -- o -- zo -- la ga -- li -- ņā, 
zelt -- o -- zo -- la ga -- li -- ņā.
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


