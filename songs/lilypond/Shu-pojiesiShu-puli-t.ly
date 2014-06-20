\version "2.13.16"
%\header {
%    title = "Šūpojiesi, šūpulīt, audzē lielu bāleliņ'",AA lapas, Šūpuļdziesmas
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
e8 e d8. c16 |
c8 b b4 |
a'8 a g8. f16 |
f8 e e4 |
e8 e d8. c16 |
c8 b b4 |
g8 b d8. b16 |
d8 c c4 |
\bar "|."
} 

lyricA = \lyricmode {
Šū -- po -- jie -- si, šū -- pu -- līt, au -- dzē lie -- lu bā -- le -- liņ',
šū -- po -- jie -- si, šū -- pu -- līt, au -- dzē lie -- lu bā -- le -- liņ'.
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


