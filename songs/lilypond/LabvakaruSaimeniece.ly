\version "2.13.16"
%\header {
%    title = "Labvakaru, saimeniece"
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


chordsA = \chordmode {
\time 2/4
c2:5 | c2:5 | f2:5 | f2:5 | c2:5 |
c2:5 | c2:5 | c2:5 | c2:5 | c2:5 | 
f2:5 | f2:5 | c2:5 | c2:5 | g2:5 | c2:5 |
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
c'8 g g g | c8 g g g |
a8 a a a | a8 b c a |
g8 g g g | c8 g g g |
g8 f e d | c8 d e f |
g4 g | g4 e 8 c |
a'4 a | c4 b 8 a |
g4 g | c8 c c 4 |
d8. c 16 b 8 b |
c2  |
\bar "|."
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
e8 e e e | e8 e e e |
f8 f f f | f8 f f f |
e8 e e e | e8 e e e |
e8 d c b | c8 d e f |
%% 9
g4 g | g4 e 8 c |
f4 f | a4 g 8 f |
%% 13
e4 e | e8 e e4 |
f8. e16 d8 f | e2 
\bar "|."
}



lyricA = \lyricmode {
Lab -- va -- ka -- ru, sai -- me -- nie -- ce,
vai tu mū -- su gai -- dī -- ju -- si,
lab -- va -- ka -- ru, sai -- me -- nie -- ce,
vai tu mū -- su gai -- dī -- ju -- si?
Rai rai rai ri -- tam, rai rai rai ri -- tam,
rai rai ral -- la -- lā, trā -- di ral -- la -- lā.
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


