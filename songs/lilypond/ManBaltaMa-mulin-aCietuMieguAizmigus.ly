\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Mana balta māmuliņa
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
c8 d e e |
e8 d c c |
c8 d e e |
e8 d d4 |
d8 g g g |
g8 f f e |
d8 d f f |
f8 e e4 |
\time 3/4
f8[ e] d2 |
\bar "|."
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
s2 |
s2 |
s2 |
s2 |
d8 c c c |
c8 c c c |
d8 d d d |
d8 a a4 |
\time 3/4
d4 d2 |
}


lyricA = \lyricmode {
Ma -- na bal -- ta mā -- mu -- li -- ņa cie -- tu mie -- gu aiz -- mi -- gus',
ma -- na bal -- ta mā -- mu -- li -- ņa cie -- tu mie -- gu aiz -- mi -- gus', ei -- jā!
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


