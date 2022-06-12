\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Maģa, maģa ābelēna"
%}
% Austras dziesmu burtnīca, 19.lpp.
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
\key g \major
\time 2/4 g'8 d e d | g8 d e d | 
d8 g \times 2/3 { e8[ d] c } | b8 c d4 |
g8 g \times 2/3 { a8[ b] a } | g8 fis g4~ 
\time 3/4 g2 r4 
\time 2/4 g8 d e d | g16 d d d e8 d | 
d8 g e( d16) c | b8 c d4 |
g8 g \times 2/3 { a8[ b] a } | g8 fis g4~ 
\time 3/4 g2 r4
\bar "|." 
}


lyricA = \lyricmode {
Ma -- ģa, ma -- ģa ā -- be -- lē -- na, pie -- ci zel -- ta ā -- bo -- lēn',
pie -- ci zel -- ta ā -- bo -- lēn'.
Ak -- tum tai -- tum ti -- di -- ri -- di rai -- dum, 
tai -- dai rī -- di ral -- lal -- lā!
Pie -- ci zel -- ta ā -- bo -- lēn'.
}


chordsA = \chordmode {
\time 2/4 g2:5 | s2 | s2 | s2 | a2:m7 | d2:7
\time 3/4 g2.:5 
\time 2/4 s2 | s2 | s2 | s2 | a2:m7 | d4:7 g4:5 
\time 3/4 s2.  
}

fullScore = <<
\new ChordNames { \chordsA }
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


