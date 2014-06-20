\version "2.13.16"
%\header {
%    title = "Aiz kalniņa dūmi kūp"
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
f8 e f f |
g8 e d e |
f4 e8([ f)] |
d2 |
f8 e f f |
g8 e d e |
f4 e8([ f)] |
d2 |
\bar "|."
} 

lyricA = \lyricmode {
Man bij vie -- na rai -- ba go -- ve, rai -- ba gos',
To aiz -- lai -- du nau -- di -- ņā -- i, nau -- di -- ņā.
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


