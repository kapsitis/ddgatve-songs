\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% No saknītes lazdiņš zieda
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 6/8
g'8 e4 f8 d4 |
f8 e4 e8 c4 |
d8 d4 e8 g4 |
f8 f4 e4. |
\bar "|."
}


voiceB = \relative c' {
\clef "treble"
\key c \major
\time 6/8
s2. |
e8 f4 e16[ d] c4 | 
s2. |
s2. |
\bar "|."
}


lyricA = \lyricmode {
No sak -- nī -- tes laz -- diņš zie -- da sar -- ka -- nie -- mi zie -- di -- ņiem; 
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


