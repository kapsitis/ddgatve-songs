\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Lācīt's kāpa ozolā"
%} 
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
\layout {
indent = #0
ragged-last = ##f
}



voiceA = \relative c' {
\clef "treble"
\key d \major
\time 2/4
d8 e fis fis | g fis e4 | 
e8 d e4 | g8 fis e4 |
e8 e fis e | g fis e4 | 
fis8 e d4 | d8 e fis4 \bar "|."  
} 

lyricA = \lyricmode {
Lā -- cīts kā -- pa o -- zo -- lā, 
ra -- ta -- tā,  ra -- ta -- tā,
Bi -- te ko -- da vē -- de -- rā, 
ra -- ta -- tā, ra -- ta -- tā.
}


fullScore = <<
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





