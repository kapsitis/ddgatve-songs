\version "2.13.16"
%\header {
%    title = "Miega dēļi es raudāju"
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
\time 2/4
c8 c e e | 
\time 3/4
g8 e e4 e | 
\time 2/4
g8 g16( a) g8 f | 
\time 3/4
e8 c e4 e | 
\time 2/4
c8 c e e |
\time 3/4
g8 e e4 e | 
\time 2/4
g8 g16( a) g8 f |
\time 3/4
e8 c e4 e 
\bar "|."
} 

lyricA = \lyricmode {
Mie -- ga dē -- ļi es rau -- dā -- ju, 
Kad mā -- mi -- ņa ma -- ni cē -- la. 
Ai -- ju, ai -- ju, ai -- ai -- jā -- di, 
Kad mā -- mi -- ņa ma -- ni cē -- la. 
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


