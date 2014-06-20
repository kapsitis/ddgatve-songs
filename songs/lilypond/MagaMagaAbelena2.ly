\version "2.13.16" 
%\header {
% title = "Maģa, maģa ābelēna"
%}
% Austras dziesmu burtnīca, 21.lpp.
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
\key a \major
\time 2/4 
\repeat volta 2 {
cis8 e cis e | cis8 e a, a | d8 cis \times 2/3 { b8[ a] b } | cis8  b a4
}
\repeat volta 2 {
e'4 fis8[ gis] | a4. e8 | fis8 fis e fis | e4 d | cis4 r  
}
}


lyricA = \lyricmode {
Ma -- ģa, ma -- ģa ā -- be -- lē -- na, pie -- ci zel -- ta ā -- bo -- lēn',
Pie -- ci zel -- ta, pie -- ci zel -- ta ā -- bo -- lēn'.
}


chordsA = \chordmode {
\time 2/4 
\repeat volta 2 {
a2:5 | s2 | e2:7 | a2:5
}
\repeat volta 2 {
s2 | s2 | d2:5 | e2:7 | a2:5 
}   
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


