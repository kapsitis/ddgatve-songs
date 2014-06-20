\version "2.13.16"
%\header {
%    title = "Uci, ļuļi mozī bārni"
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
\key a \minor
\time 2/4
\slurDashed
e8 e e e | a8 a a c | b8 a c b | a8 a a( a) | c8[ a] c a | c4 r 
\bar "|." 
} 

lyricA = \lyricmode {
U -- ci ļu -- ļi mo -- zī  bār -- ni, kas jums rei -- tā pa -- lei -- guos? 
Ā -- ā -- ā Ā!
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


