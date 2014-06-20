\version "2.13.16"
%\header {
%    title = "Uz ūdeņa uziedamis, Dievam devu dvēselīt'",Budēlīši, jūra
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
\key bes \major
\time 2/4
bes'8\fermata c bes f |
bes8 bes bes f |
bes8 bes bes16[ a] bes8 |
bes8 bes c4 |
c8 c d8. c16 |
c16[ bes] bes8 bes bes |
c8 c d8. c16 |
c16[ bes] bes8 bes4 |
\bar "|."
} 

lyricA = \lyricmode {
Uz ū -- de -- ņa uz -- ie -- da -- mis, Die -- vam de -- vu dvē -- se -- līt',
uz ū -- de -- ņa uz -- ie -- da -- mis, Die -- vam de -- vu dvē -- se -- līt'.
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


