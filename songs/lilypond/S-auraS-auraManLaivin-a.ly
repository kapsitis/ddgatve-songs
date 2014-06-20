\version "2.13.16"
%\header {
%    title = "Šaura, šaura man laiviņa"
%}
% Laivas pasākums, p.6
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
g'4. g8 d4 a' |
g4 d d8[ e] f4 |
e4 c b e |
d4. c8 a4 a' |
a8[ g f] e8 d2 |
\bar "|."
} 

lyricA = \lyricmode {
Šau -- ra, šau -- ra man lai -- vi -- ņa, man lai -- vi -- ņa, no -- plī -- su -- si zē -- ģe -- līt'.
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



