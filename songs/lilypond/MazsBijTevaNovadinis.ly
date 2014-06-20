\version "2.13.16" 
%\header {
% title = "Mazs bij' tēva novadiņis"
%}
% Austras dziesmu burtnīca, 22.lpp.
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
\key f \major
\time 2/4 c8 a c c 
\time 3/4 a8 c f[ a] a4 | f8 f d'4. d8 | c8 bes a2 
\time 2/4 a8 g a g | f8 e f d 
\time 3/4 g8 g g f e d | c8[ c'~] c2 
\time 2/4 c8 c c bes | a4 g | f2~ | f4 r4 
}


lyricA = \lyricmode {
Mazs bij' tē -- va no -- va -- di -- ņis, bet di -- že -- ni tu -- rē -- jās. 
Mazs bij' tē -- va no -- va -- di -- ņis, bet di -- že -- ni tu -- rē -- jās, 
bet di -- že -- ni tu -- rē -- jās.
}


chordsA = \chordmode {
\time 2/4  f2:5
\time 3/4 s2. | s4 bes2:5 | a4:m f2:5 
\time 2/4 a2:m | d2:m
\time 3/4 g2.:5 | c2.:5
\time 2/4 s4 c4:7 | s2 | f2 | s2
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


