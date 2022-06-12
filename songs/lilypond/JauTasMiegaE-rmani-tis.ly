\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Jau tas miega ērmanītis"
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
c'8 c a a | b8 a a a | b8 b a b | c8 a b4 |
b16( c) d8  c16( b) a8 | b8 b b4 | 
a8 a a a | \times 2/3 { a4 a a } | b2\fermata 
\bar "|." 
} 

lyricA = \lyricmode {
Jau tas mie -- ga ēr -- ma -- nī -- tis 
Ap ma -- nī -- mi lum -- stī -- jās. 
Jau tas mie -- ga ēr -- ma -- nīt's 
Ap ma -- nī -- mi lum -- stī -- jā -- si. 
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


