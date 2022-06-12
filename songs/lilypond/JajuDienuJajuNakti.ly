\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Jāju dienu, jāju nakti"
%}
% Austras dziesmu burtnīca, 17.lpp.
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
\time 3/4
c4 d e8 f | g4 a g8 g | a4 g a8 b 
\time 2/4
c8[ b a] c 
\time 4/4
g2. c8 a  
\repeat volta 2 {
g4 e a8 g | f[ e] d4 g8 f | e8. c16 c8 d e c 
\time 2/4
b4 g 
}
\alternative { { \time 4/4 c2. c'8 a } { c,2. r4 } }
}


lyricA = \lyricmode {
Jā -- ju die -- nu, jā -- ju nak -- ti smuk -- mei -- ti -- ņas lū -- ko -- ties. 
Ne -- tī -- šā -- mi  es ie -- gā -- ju mei -- tu mā -- tes sē -- ti -- ņā -- i, sē -- ti -- ņā. 
Ne -- tī-
ņā.  
}


chordsA = \chordmode {
\time 3/4
c2.:5 | s2. | f2.:5 
\time 2/2 s2 
\time 4/4 c2.:5 f4:5 
\repeat volta 2 {
\time 3/4
a2.:7 | d2.:m | c2.:5 \time 2/4 g2:5
}
\alternative { { \time 4/4 c2.:5 f4:5 } { c1:5 } }  
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


