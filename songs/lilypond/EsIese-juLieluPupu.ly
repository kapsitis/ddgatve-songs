\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Es iesēju lielu pupu",AA lapas
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
c8 g' g g |
g8 f e d |
e8 d g4 |
e8 d g4 |
c,8 e e e |
e8 d c c |
d8. c16 b8 d |
c4 r8 f8 |
e4 r8 d8 |
c2 |
\bar "|."
} 

lyricA = \lyricmode {
Es ie -- sē -- ju lie -- lu pu -- pu, nu -- ka -- tā, nu -- ka -- tā,
bal -- tā ro -- žu dār -- zi -- ņā -- i, tra -- di -- ri -- di -- rā, tral -- lā, ral -- lā!
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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


