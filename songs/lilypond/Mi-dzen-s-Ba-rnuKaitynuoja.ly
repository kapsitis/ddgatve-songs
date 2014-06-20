\version "2.13.16"
%\header {
%    title = "Mīdzeņš bārnu kaitynuoja"
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
\key c \major
\time 4/4
\repeat volta 2 {
a'8 g g d f e e e | 
a8 g g d f e e4 | 
c8 c d d f e e e | 
c8 c d d f e e4 |
}
} 

lyricA = \lyricmode {
Mī -- dzeņš bār -- nu kai -- ty -- nuo -- ja
Iz slīk -- snī -- ša sā -- dā -- dams. 
Mī -- dzeņš bār -- nu kai -- ty -- nuo -- ja
Iz slīk -- snī -- ša sā -- dā -- dams. 
} 


fullScore = <<
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


