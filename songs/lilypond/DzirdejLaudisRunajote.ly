\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Dzirdēj' ļaudis runājote"
%}
% Austras dziesmu burtnīca, 10.lpp.
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
\key c \major
\time 5/8
\repeat volta 2 {
e8 e e4 d16[ e] | f8 f f4 e8 | d8 d d4 c8 | e8 e e4 c16[ d] | e4~ e4.
}
}


lyricA = \lyricmode {
Dzir -- dēj' ļau -- dis ru -- nā -- jo -- te, 
ka man' mī -- ļā at -- stā -- jot, e -- ei... 
}


chordsA = \chordmode {
c2:5 s8 | d2:m s8 | g2:5 s8 | a2:m s8 | s2 s8
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


