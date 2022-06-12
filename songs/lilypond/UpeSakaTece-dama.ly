\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Upe saka tecēdama"
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
g'8 g g4 e8 |
g8 e c4 e8 |
g8 e d4 c8 |
b8 a g[ a] b |
c8 c c[ d] e |
f8 e d4. |
f8 a g4 f8 |
e8 d c4. |
\bar "|."
} 


lyricA = \lyricmode {
U -- pe sa -- ka te -- cē -- da -- ma: es ba -- gā -- ta mā -- tes mei -- ta,
ai -- rai -- rī -- di ral -- lal -- lā, es ba -- gā -- ta mā -- tes meit'.
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



