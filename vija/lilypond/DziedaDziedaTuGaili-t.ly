\version "2.13.16"
%\header {
%    title = "Dzieda, dzieda tu gailīt", AA lapas, Jāņi
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
\time 6/8
d4 f8 e d4 |
e8 d4 e r8 |
d4 f8 e d4 |
e8 d4 e r8 |
d4 f8 e d4 |
e8 d4 e r8 |
d4 f8 e d4 |
e8 d4 e r8 |
\bar "|."
} 

lyricA = \lyricmode {
Dzie -- da, dzie -- da, tu gai -- līt, ne -- būs die -- na da -- žu -- laik',
dzie -- dās jū -- ras gai -- ga -- liņ', nāks die -- ni -- ņa lī -- go -- dam'.
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


