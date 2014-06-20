\version "2.13.16"
%\header {
%    title = "Zīdēja pučeitis"
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
\time 4/4
e4 e e g | f4 f f8[( e]) d4 \time 2/4
f8 e f g \time 4/4
a4 g4 e2 | a4 a a c | g4 g g( a8) g \time 2/4
f8 e f g \time 4/4
a4 g e2
\bar "|."
} 

lyricA = \lyricmode {
Zī -- di, zī -- di, ru -- dzu vuor -- pa,
De -- ve -- ņo -- m(i) ai -- le -- ņom.
Zī -- di, zī -- di, ru -- dzu vuor -- pa,
De -- ve -- ņo -- m(i) ai -- le -- ņom.
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


