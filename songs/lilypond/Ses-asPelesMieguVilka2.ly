\version "2.13.16"
%\header {
%    title = "Sešas peles miegu vilka"
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
\time 5/4
\repeat volta 2 {
c8 c e e g e e4 e | 
g8 g16( a) g8 f e c e4 e |
c8 c e e g e e4 e | 
g8 g16( a) g8 f e c e4 e |
}
} 

lyricA = \lyricmode {
Se -- šas pe -- les mie -- gu vil -- ka 
Ma -- za -- ja -- mi bēr -- ni -- ņa -- mi. 
Ai -- ju, ai -- ju, ai -- jai -- jā -- di, 
Ma -- za -- ja -- mi bēr -- ni -- ņa -- mi. 
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


