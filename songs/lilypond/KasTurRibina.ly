\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kas tur rībina"
%}
% Dievsētas ļaudis. Gadskārtu dziesmas. 2007 (#27)
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
g2:5 | g2:5 | g2:5 | g2:5 | g2:5 | g2:5 | g2:5 | g2:5 | 
g2:5 | g2:5 | g2:5 | g2:5 | g2:5 | g2:5 | g2:5 | g2:5 | 
g2:5 | g2:5 | g2:5 | g2:5 | g2:5 | g2:5 | g2:5 | g2:5 |  
}


voiceA = \relative c'' {
\time 2/4
\clef "treble"
\key g \major
\tempo 4 = 144
g4 d | g4 d8 d | g4 g8 fis | g4 g |
d4 d | d4 d8 d | d4 d8 d | d4 d
\bar "|."
g8 d d d | g4 d8 d | g8 fis g fis | g4 g |
d8 d d d | d4 d | d8 d d d | d4 d
\bar "|."
g8 d d d | g8 d d d | g8 fis g fis | g8 fis g4 |
d8 d d d | d8 d d d | d8 d d d | d8 d d d
\bar "|."
} 

lyricA = \lyricmode {
\set stanza = #"1." Kas tur rī -- bi -- na gar is -- ta -- bi -- ņu, 
Kas tur rī -- bi -- na gar is -- ta -- bi -- ņu?
\set stanza = #"2." Ķe -- ka -- ti -- ņas dan -- ci -- na sa -- vus ku -- me -- li -- ņus, 
Ķe -- ka -- ti -- ņas dan -- cin' sa -- vus ku -- me -- li -- ņus.
\set stanza = #"3." Ne -- gu -- li -- ta, slin -- ki pui -- ši, ei -- ta, rau -- gat zir -- gu stall', 
Ne -- gu -- li -- ta, slin -- ki pui -- ši, ei -- ta, rau -- gat zir -- gu stal -- li!
} 

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
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


