\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Sit, Jānīti, vara bungas"
%}
% Katrīna Riekstiņa, #45 (Grodi)
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
\time 4/4
\repeat volta 4 {
c8 e e c e d c c | e4 c d c 
}
\repeat volta 2 {
e8 <<e g>> <<e g>> e <<e g>> <<d f>> e e | <<e4 g>> e <<d f>> e
}
} 

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 4/4
\repeat volta 4 {
s1 | c4 c a c
}
\repeat volta 2 {
c8 c c c c a c c | c4 c a c
}
}

lyricAA = \lyricmode {
Sit, Jā -- nī -- ti, va -- ra bun -- gas, lī -- go, lī -- go,
Sit, Jā -- nī -- ti, va -- ra bun -- gas, lī -- go, lī -- go,
}

lyricAB = \lyricmode {
Vār -- tu sta -- ba ga -- li -- ņā -- i, lī -- go, lī -- go, 
Vār -- tu sta -- ba ga -- li -- ņā -- i, lī -- go, lī -- go.
}

chordsA = \chordmode {
\time 4/4
\repeat volta 2 {
c1:5 | c2:5 g4:5 c4:5 |
}
\repeat volta 2 {
c1:5 | c2:5 g4:5 c4:5 |
}
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceA" \lyricAA
\new Lyrics \lyricsto "voiceA" \lyricAB
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



