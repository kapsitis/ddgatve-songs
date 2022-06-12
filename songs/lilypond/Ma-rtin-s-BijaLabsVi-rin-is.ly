\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Mārtiņš bija labs vīriņis
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key a \major
\time 2/4
e8 e a8. gis16 |
gis8 fis fis fis |
fis8 fis gis8. fis16 |
fis8 e e4 |
cis8 d d8. cis16 |
cis8 b b4 |
b8. cis16 cis8. b16 |
b8 a a4 |
\bar "|."
}





lyricA = \lyricmode {
 Mār -- tiņš bi -- ja labs vī -- ri -- ņis, tas til -- ti -- ņa grī -- dē -- jiņš,
 ram -- tai -- rī -- di ral -- lal -- lā, tas til -- ti -- ņa grī -- dē -- jiņš.
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
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


