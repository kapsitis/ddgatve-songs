\version "2.13.16"
%\header {
%    title = "Desa teki pa celiņu ",Laivas lapas,Ziemassvētki
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
\key d \minor
\time 2/4
%MS
d8 d e e |
g8 f e d |
g4 e8 e |
%ME
e4 e8 e |
d8 d e e |
g8 f e d |
\time 4/4
g4 e8 e e2 |
\bar "|."
}

lyricA = \lyricmode {
 De -- sa te -- ki pa ce -- li -- ņu, to -- ta -- ri, to -- ta -- ri,
 lī -- ku -- mi -- ņus mē -- tā -- da -- ma, to -- ta -- ri, to!
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


