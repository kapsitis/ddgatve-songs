\version "2.13.16"
%\header {
%    title = "Peliņš brauca, ratiņ' čīksta"
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
e8 e a a | g8 f e d | e8 g a e | g8. f16 e4 |
f8 e d c | b8 a e'4 | f8 e d a | c8 d e4
\bar "|."
} 

lyricA = \lyricmode {
Pe -- liņš brau -- ca, ra -- tiņ' čīk -- sta, 
bēr -- ni -- ņa -- mi mie -- dziņ' ved.
Pe -- liņš brau -- ca, ra -- tiņ' čīkst, 
bēr -- ni -- ņa -- mi mie -- dziņ' ved.
  
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


