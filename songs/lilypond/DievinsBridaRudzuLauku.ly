\version "2.13.16"
%\header {
%    title = "Dieviņš brida rudzu lauku"
%}
% Pierakstīta no kasetes pēc atmiņas
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


voiceA = \transpose e c' { \relative c' {
\clef "treble"
\key e \major
\time 2/4
e8 fis gis gis | a8 gis fis e | e8 gis gis gis | a8 gis fis e 
\time 3/4 e8[ fis] gis2 | fis4 e2 
\time 2/4 fis8 fis gis fis | fis8 e e4\fermata 
\bar "|."
} }



lyricA = \lyricmode {
Die -- viņš bri -- da ru -- dzu lau -- ku
Ar pe -- lē -- ku mē -- te -- lī -- ti, lī -- go, lī -- go,
ar pe -- lē -- ku mē -- te -- līt'.
}

voiceB = \transpose e c' { \relative c' {
\clef "treble"
\key e \major
\time 2/4
s2 | s2 | s2 | s2 
\time 3/4 
gis4 gis2 | a4 gis2 
\time 2/4 
dis'8 dis b a | a8 gis gis4\fermata 
\bar "|."
} }

chordsA = \chordmode {
\time 2/4
c2:5 | c2:5 | c2:5 | c2:5 |
\time 3/4
c2.:5 | g4:5 c2:5 | 
\time 2/4
g2:5 | g4:5 c4:5 |
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


