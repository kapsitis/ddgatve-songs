\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Skaista mana tēvu zeme"
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
\key f \major
\time 2/4
f8 a a8. a16 | a8 g g g | 
f8 a c8. c16 | bes8 a a4 |
c8 d d8. d16 | d8 c8 c8. c16 |
f,8 g bes8. g16 | g8 f a4 
\bar "|."
} 


lyricA = \lyricmode {
Skai -- sta ma -- na tē -- vu ze -- me 
par vi -- sā -- mi ze -- mī -- tēm.
Skai -- sta ma -- na tē -- vu ze -- me 
par vi -- sā -- mi ze -- mī -- tēm.
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



