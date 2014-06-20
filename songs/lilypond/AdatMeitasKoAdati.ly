\version "2.13.16"
%\header {
%    title = "Adat, meitas, ko adati"
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
\key g \major
\time 2/4
b'8 d, d d | g8 fis g a | 
b8 d, d d | g8 fis g a |
b8 b c b | b8 a a4 |
a8 a b a | a8 g g4 |
\bar "|."
} 


lyricA = \lyricmode {
A -- dat, mei -- tas, ko a -- da -- ti, a -- dat mei -- tas ko a -- da -- ti,
Vil -- kam ze -- ķes no -- a -- dat, vil -- kam ze -- ķes no -- a -- dat.
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



