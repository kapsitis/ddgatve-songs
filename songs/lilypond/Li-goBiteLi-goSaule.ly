\version "2.13.16"
%\header {
%    title = "līgo saule, līgo bite",AA lapas
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
\time 5/8
c8 c e4 e8 |
d8 b c4 c8 |
c8 e g4 g8 |
\slurDashed
g8 f e4( e8) |
c8 c f4 f8 |
f8 e e4 c8 |
e8 d d4 d8 |
e8 d c4.
\bar "|."
} 

lyricA = \lyricmode {
Lī -- go bi -- te, lī -- go Sau -- le, balt -- ā -- bo -- la pļa -- vi -- ņā, 
lī -- go bi -- te, lī -- go Sau -- le, balt -- ā -- bo -- la pļa -- vi -- ņā
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

