\version "2.13.16" 
%\header {
% title = "Div' pļaviņas es nopļāvu"
%}
% Austras dziesmu burtnīca, 7.lpp.
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
\time 4/4
d4 g g4. fis8 | e4 g d4. d8 | g4 g a4. g8 | fis4 a g2 |
g4 b d4. c8 | b4 a8[ b] c4. b8 | d,4 g b4. a8 | g4 fis g2
\bar "|."
}


lyricA = \lyricmode {
Div' pļa -- vi -- ņas es no -- pļā -- vu sar -- ka -- nā -- i ā -- bo -- liņ'.
Div' pļa -- vi -- ņas es no -- pļā -- vu sar -- ka -- nā -- i ā -- bo -- liņ'.
}


chordsA = \chordmode {
g1:5 | c2:5  g2:5 | s2 a2:m | d2:5 g2:5 |
s2 g2:7 | c2:5 c2:m | g2:5 c2:5 | d2:7 g2:5
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


