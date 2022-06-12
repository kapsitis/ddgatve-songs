\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Iestādīju baltu rozi",AA lapas, 
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
\time 2/4
f8 f e8. d16 |
c8 e d8. c16 |
f8 f e8. d16 |
c8 e d8. c16 |
c8 d e8. d16 |
d8 d c4 |
c8 d e8. d16 |
d8 d c4 |
\bar "|."
} 

lyricA = \lyricmode {
Ie -- stā -- dī -- ju bal -- tu ro -- zi, ie -- stā -- dī -- ju bal -- tu ro -- zi,
bal -- tā smil -- šu kal -- ni -- ņā, bal -- tā smil -- šu kal -- ni -- ņā
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


