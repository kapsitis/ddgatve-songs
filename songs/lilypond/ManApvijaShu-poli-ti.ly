\version "2.13.16"
%\header {
%    title = "Man apvija šūpolīti",AA lapas, Šūpuļdziesmas
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
e8 e d16[ e] g8 |
e8 d c <g \parenthesize \tweak #'font-size #-2 d' >8 |
c8 c d16[ e] f8 |
e8 a g4 |
a8 g a b |
c8 b16[ a] g8 f |
e8 d16[ e] f8 d |
c8 c8 c4 |
\bar "|."
} 

lyricA = \lyricmode {
Man ap -- vi -- ja šū -- po -- lī -- ti ko -- ša -- jie -- mi zie -- di -- ņiem;
 man ap -- vi -- ja šū -- po -- lī -- ti ko -- ša -- jie -- mi zie -- di -- ņiem.
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


