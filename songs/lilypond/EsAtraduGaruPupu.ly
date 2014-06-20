\version "2.13.16" 
%\header {
% title = "Es atradu garu pupu"
%}
% Austras dziesmu burtnīca, 12.lpp.
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.3\cm
between-system-space = 0.3\cm
}
\layout {
indent = #0
ragged-last = ##f
}

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 4/4
d4 d fis8 e d e | fis4 d~ d2 | fis4 fis a8 g fis g | a4 fis4~ fis2 |
a4 a b8 a g fis \time 2/4 g4 g \time 4/4
g4 g a8 g fis e | fis1
}


lyricA = \lyricmode {
Es at -- ra -- du ga -- ru pu -- pu, 
es at -- ra -- du ga -- ru pu -- pu, 
līdz pa -- šā -- mi de -- be -- sī -- mi, 
līdz pa -- šā -- mi de -- be -- sīm. 
}


chordsA = \chordmode {
d1:5 | s1 | s1 | s1 | s1 \time 2/4
e2:m \time 4/4
a1:7 | d1:5
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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


