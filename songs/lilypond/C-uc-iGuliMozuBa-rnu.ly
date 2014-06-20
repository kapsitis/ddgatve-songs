\version "2.13.16"
%\header {
%    title = "Čuči, guli, mozu bārnu"
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
e8 e c' b | a8 gis a c | e,8 e c' b | a8 gis a c
\bar "|." 
} 

lyricA = \lyricmode {
Ču -- či, gu -- li, mo -- zu bār -- nu, kai pe -- lei -- te mi -- dze -- ņā -- i. 
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


