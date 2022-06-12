\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% "Velc pelīte saldu miegu",AA lapas, Šūpuļdziesmas
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\repeat volta 2 {
\phrasingSlurDashed
a8 a d\( d\) |
f8 d e\( e\) |
f8 d d a |
d8 d d4 |
}
} 

lyricA = \lyricmode {
Velc, pe -- lī -- te, sal -- du mie -- gu ma  -- za -- ja -- mi bēr -- ni -- ņam!
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



