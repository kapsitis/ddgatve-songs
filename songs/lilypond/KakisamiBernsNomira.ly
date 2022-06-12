\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kaķīšami bērns nomira"
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
f8 f f f | f8 e d e | 
f4 e8 e | f4 e8 e | 
f8 f f f | f8 e d e | 
f4 e8 e | f4 e8 e 
\bar "|." 
} 



vardiBalssA = \lyricmode {
Ka -- ķī -- ša -- mi bērns no -- mi -- ra, 
tā -- ta -- ri, tā -- ta -- ri, 
Zie -- mas svēt -- ku va -- ka -- rā -- i, 
tā -- ta -- ri, tā -- ta -- ri! 
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \vardiBalssA
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


