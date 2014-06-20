\version "2.13.16"
%\header {
%    title = "Zin', Dieviņi kālabadi",AA lapas
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
e8 g f e |
d8 g c, c |
}
\repeat volta 2 {
\time 2/4
f8 a a a |
\time 3/4
e8 f g4 g |
d8 d c2 |
}
} 

lyricA = \lyricmode {
Zin', Die -- vi -- ņi, kā -- la -- ba -- de, 
es ne -- va -- ru līk -- sma bū -- ti, līk -- sma būt.
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


