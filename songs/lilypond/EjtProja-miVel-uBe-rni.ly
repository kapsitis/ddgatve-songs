\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ej't projāmi, veļu bērni",AA lapas, veļu laiks
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
\repeat volta 2 {
\time 2/4
f8 f e e |
f16[ e] d8 e8. e16 |
f8 f e d |
d8 c c4 |
}
} 

lyricA = \lyricmode {
Ej't pro -- jā -- mi, ve -- ļu bēr -- ni, pa ce -- li -- ņu ce -- li -- ņiem!
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


