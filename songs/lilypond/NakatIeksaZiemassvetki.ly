\version "2.13.16"
%\header {
%    title = "Nākat iekšā, Ziemassvētki"
%}
% sk. arī AALapas; Ziemassvētki atnākdami, kalado, kalado
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


chordsA = \chordmode {
\time 2/4
c2:5 | f4:5 c4:5 | f4:5 c4:5 | g4:5 c4:5 |   
c2:5 | f4:5 c4:5 | g4:5 c4:5 |
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
e8 d c c | a'8 a g g |
f8 e e4 | f8 f g4 |
g8 g g e | a8 a g g |
f8 e e4\fermata |
\bar "|."
}

lyricA = \lyricmode {
Nā -- kat iek -- šā, Zie -- mas -- svēt -- ki,
ka -- la -- do, ka -- la -- do,
Nu mēs jū -- su gai -- dī -- si -- mi,
ka -- la -- do.
}

voiceB = \relative c' {
e8 d c c | f8 f e e |
d8 c c4 | d8 d e4 |
e8 d c c | f8 f e e |
d8 c c4\fermata |
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


