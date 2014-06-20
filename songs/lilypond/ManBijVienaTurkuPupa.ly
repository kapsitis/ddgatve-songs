\version "2.13.16"
%\header {
%    title = "Man bij viena turku pupa",AA lapas
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
c8 e c e |
g8 e g e |
d8 f d f |
a8 g g4 |
g4 g8 e |
g4 g8 e |
f8 f f f |
f8 f f f |
g4 g8 e |
g4 g8 e |
f8 d f d |
c8 c c4 |
}


lyricA = \lyricmode {
Man bij' vie -- na tur -- ku pu -- pa, ne -- zi -- nā -- ju kur stā -- dīt,
tūr -- lu -- pam, tūr -- lu -- pam, hai -- ram sur -- kam tur -- kam pu -- pam,
tūr -- lu -- pam, tūr -- lu -- pam, vir, vir, vir, vir, bum, bum, bum!
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


