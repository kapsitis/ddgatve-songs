\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Es atradu raibu pupu"
%}
% Austras dziesmu burtnīca, 13.lpp.
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
\time 2/4
f8 a f g | g8 g16[ f] e8 d | d8 f d f | g8 g g f |
a8. g16 f8 g | a8 g16[ f] e8 d | d8 f d f | g8 g g4
}


lyricA = \lyricmode {
Es at -- ra -- du rai -- bu pu -- pu, 
Ne -- zi -- nā -- ju, kur stā -- dī -- ti, 
Es at -- ra -- du rai -- bu pu -- pu, 
Ne -- zi -- nā -- ju, kur stā -- dīt.
}


chordsA = \chordmode {
d4:m f4:5 | c4.:5 d8:m | s2 | c2:5 | 
f4.:5 c8:5 | f8:5 c4:5 d8:m | s2 | c2:5
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


