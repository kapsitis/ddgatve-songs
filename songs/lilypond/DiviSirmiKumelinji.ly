\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Divi sirmi kumeliņi",AA lapas
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
\time 3/4
d4 f e8 d |
e4 e e16[ d] e8 |
a4 a8[ c] b8 a |
\time 4/4
g4 e a4( g8) f |
\time 3/4
e4 g a8 e |
f8[ e] d4 c8 a |
d4 f a8 e |
\time 4/4
d4 c8[e] d2 |
\bar "|."
} 

lyricA = \lyricmode {
Di -- vi sir -- mi ku -- me -- li -- ņi uz ak -- me -- ņa au -- zas ē -- da, 
di -- vi sir -- mi ku -- me -- li -- ņi uz ak -- me -- ņa au -- zas ēd'. 
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

