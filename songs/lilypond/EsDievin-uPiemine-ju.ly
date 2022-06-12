\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Es Dieviņu pieminēju
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 3/4
c8 d e4 d |
g8 f e4 d |
c8 d e4 e |
d8 b c2 |
c8 d e4 d |
g8 f e4 d |
c8 d e4 e |
d8 b c2 |
\bar "|."
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 3/4
s2. |
s2. |
s2. |
s2. |
c8 c c4 c |
c8 c c4 c |
c8 c c4 c |
g8 g c2 |
\bar "|."
}


lyricA = \lyricmode {
Es Die -- vi -- ņu pie -- mi -- nē -- ju i rī -- tā -- i va -- ka -- rā,
es Die -- vi -- ņu pie -- mi -- nē -- ju i rī -- tā -- i va -- ka -- rā:
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


