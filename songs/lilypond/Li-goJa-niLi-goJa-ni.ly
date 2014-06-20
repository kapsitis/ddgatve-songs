\version "2.13.16"
%\header {
%    title = "Līgo, Jāni, līgo, Jāni",AA lapas, Jāņi
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
e8 e e e |
e8 d d a |
d4 e\fermata |
d4 d |
e8 e e e |
e8 d d a |
d4 e\fermata |
\bar "|."
} 

lyricA = \lyricmode {
Lī -- go, Jā -- ni, Lī -- go, Jā -- ni, lī -- go, lī -- go, nu tā ta -- va die -- na nā -- ca, lī -- go!
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


