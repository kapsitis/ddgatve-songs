\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kur tu teci melna ūdre",AA lapas
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
\repeat volta 2 {
\time 4/4
a4 a c c |
d4 e d c |
d8[ c] d[ f] d4 c |
d4 c a2 |
}
} 

lyricA = \lyricmode {
Kur tu te -- ci mel -- na ūd -- re, tum -- si -- ņā -- i, va -- ka -- rā?
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


