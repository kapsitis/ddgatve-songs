\version "2.13.18"
#(ly:set-option 'crop #t)
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
\time 4/4
e4 f e d |
\time 2/4
e8 e e f |
g8 f e f |
\time 5/4
d2 f4 e f |
\time 2/4
f8 e d e |
f8 f e e |
\time 5/4
d2 f4 e d
\bar "|."
}


voiceB = \relative c' {
\clef "treble"
\key c \major
\time 4/4
e4 f c d 
\time 2/4
c8 c c d |
e8 d c c |
\time 5/4
d2 d4 c d |
\time 2/4
d8 d d d |
d8 d c c |
\time 5/4
d2 d4 c d |
\bar "|."
}


lyricA = \lyricmode {
Pār -- kiuņs ve -- de, pār -- kiuņs ve -- de ve -- dek -- le -- ņu, 
ve -- dek -- le -- ņu,
vy -- su me -- žu du -- cy -- nuo -- ja, 
du -- cy -- nuo -- ja. 
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceB" \lyricA
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


