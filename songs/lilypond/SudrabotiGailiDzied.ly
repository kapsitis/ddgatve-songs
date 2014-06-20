\version "2.13.16"
%\header {
%    title = "Sudraboti gaiļi dzied"
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
\key cis\minor
\repeat volta 2 {
\time 2/4
e8. e16 dis8 cis | dis8. cis16 cis4 
\time 3/4 
cis4 dis2 | e4 cis2 
}
} 

lyricAA = \lyricmode {
Su -- dra -- bo -- ti gai -- ļi1 dzied, lī -- go, lī -- go,
} 

lyricAB = \lyricmode {
Zelt -- u -- pī -- tes ma -- li -- ņā, lī -- go, lī -- go.
} 

voiceB = \relative c' {
\clef "treble"
\key cis\minor
\repeat volta 2 {
\time 2/4
cis2~ | cis2~ 
\time 3/4 
cis2.~ | cis2.
}
} 


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricAA
\lyricsto "voiceA" \new Lyrics \lyricAB
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


