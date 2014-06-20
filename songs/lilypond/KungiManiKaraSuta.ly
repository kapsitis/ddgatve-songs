\version "2.13.16"
%\header {
%    title = "Kungi mani karā sūta"
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
\key e \minor
\time 3/4
e8 d e4 e | d8 fis fis[ d] d4 |
e8 d e4 e | d8 fis fis[ d] d4 |
e8 d e4 e | b8[ g' fis] e d d |  
e8 d e4 e | b8[ g' fis] e d4
\bar "|."    
} 



lyricA = \lyricmode {
Kun -- gi ma -- ni ka -- rā sū -- ta, 
kun -- gi ma -- ni ka -- rā sū -- ta
Ar to le -- dus zo -- ben -- ti -- ņu, 
Ar to le -- dus zo -- ben -- tiņ.
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


