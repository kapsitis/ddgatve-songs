\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
%Dzied pa priekšu brāļu māsa
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key a \minor
\time 2/4
d8 f f g |
e8 d d e |
d8 g e g |
f8 e g e |
f8 f g f |
f8 e e f |
g8 f f g |
f8 f e4\fermata |
d4( d16)[ b] s8 |
\bar "|."
}


voiceB = \relative c' {
\clef "treble"
\key a \minor
\time 2/4
d8 g g g |
s2 |
s2 |
s2 |
c,8 d d d |
d8 d c c |
d8 d d d |
d8 d c d( |
d4)  
\bar "|."
}


lyricA = \lyricmode {
Dzied' pa priek -- šu brā -- ļu mā -- sa, pa -- vilk -- da -- ma, lo -- cī -- da -- ma;
dzied' pa priek -- šu brā -- ļu mā -- sa, pa -- vilk -- da -- ma, lo -- cī -- da -- ma.
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


