\version "2.13.16" 
%\header {
% title = "Es savai māmiņai"
%}
% Austras dziesmu burtnīca, 14.lpp.
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
a4 d fis4. d8 | g4 fis fis4. e8 | fis4 a a4. a8 | g4. fis8 e2 |
\repeat volta 2 {
d4 g b4. g8 | b4 a a4. fis8 | a4 g8[ fis] e4 g | fis4. e8 d2
}  
}


lyricA = \lyricmode {
Es sa -- va -- i mā -- mi -- ņa -- i kā sirs -- ni -- ņa a -- zo -- tē, 
kā sirs -- ni -- ņa a -- zo -- tē -- i, kā pu -- ķī -- te -- dār -- zi -- ņā.  
}


chordsA = \chordmode {
\time 4/4
d1:5 | s1 | fis1:m | e2:m a2:5 |
\repeat volta 2 {
g1:5 | fis2:m b2:7 | e2:m a2:7 | s2 d2:5
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


