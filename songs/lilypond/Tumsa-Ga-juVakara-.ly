\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Tumsā gāju, vakarā
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
s2 |
s2 | 
s2 |
g'8 g f f |
e8 g g f |
g8 f e4 |
a,8 g' g f |
g8 f e[ f] |
d8 f g f |
g8 f e4 |
\bar "|."
}


voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
a8 e' e e |
e8 d e e |
d8 e d d |
e8 d e e |
d8 d e e |
e8 d e4 |
a,8 e' d d |
d8 d e[ f] |
d8 d d d |
d8 d e4 
\bar "|."
}


lyricA = \lyricmode {
Tum -- sā gā -- ju va -- ka -- rā -- i,
kas ar ma -- ni bied -- ram nā -- ca, 
Tum -- sā gā -- ju va -- ka -- rā,
kas ar ma -- ni bied -- ram nāc', 
kas ar ma -- nim bied -- ram nāc'?
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\lyricsto "voiceB" \new Lyrics \lyricA
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


