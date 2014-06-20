\version "2.13.16"
%\header {
%    title = "Pinu, pinu sietu"
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
c8 d e f | g4 c | a4 c8 a | g4 g8 g | 
f4 f8 f | e4 e8 e8 | d4 e8 d8 | c4 c | 
g'8 f e d | c4 r4
\bar "|."
} 

voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
c8 d e f | g4 c | a4 c8 a | g4 g8 g | 
f4 f8 f | e4 e8 e8 | d4 e8 d8 | c4 c | 
g'8 f e d | c4 
\oneVoice
r4
\bar "|."
} 

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
c8 d e f | e4 g | f4 a8 f | e4 e8 e | 
d4 d8 d | c4 c8 c8 | g4 g8 g8 | c4 c | 
e8 d c g | c4 s4
\bar "|."
} 

lyricAA = \lyricmode {
Pi -- nu, pi -- nu sie -- tu, sa -- pi -- nu vai -- na -- gu, 
sa -- pi -- nu vai -- na -- gu no za --  ļas zā -- les. 
Cie -- ši sa -- pi -- nu. 
}


lyricAB = \lyricmode {
Pi -- nu, pi -- nu sie -- tu, iz -- pi -- nu vai -- na -- gu, 
iz -- pi -- nu vai -- na -- gu no za --  ļas zā -- les. 
La -- bi iz -- pi -- nu. 
}

chordsA = \chordmode {
\time 2/4
c2:5 | c2:5 | f2:5 | c2:5 | f2:5 | 
c2:5 | g2:5 | c2:5 | g2:5 | c2:5 |
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricAA
\lyricsto "voiceA" \new Lyrics \lyricAB
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


