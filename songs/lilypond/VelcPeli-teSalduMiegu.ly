\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
%    title = "Velc pelīte saldu miegu",AA lapas, Šūpuļdziesmas
\layout {
indent = #0
ragged-last = ##f
}



voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\repeat volta 2 {
g'8 e g g |
f8 d f f |
e8 c e d |
d8 b c4 |
}
} 

lyricA = \lyricmode {
Velc pe -- lī -- te sal -- du mie -- gu ma -- za -- ja -- mi bēr -- ni -- ņam
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


