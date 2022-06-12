\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Lien, pelīte, pazemītē",AA lapas, bēres
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
\key e \minor
\time 2/4
e8 d16[ c] b8 b |
e8 dis e fis |
g8 g fis fis |
b,8 b e4 |
d4 d8 c16 b |
a8 d16[ c] b4 |
g'8 g fis fis |
b,8 b e4 |
\bar "|."
} 

lyricA = \lyricmode {
Lien, pe -- lī -- te, pa -- ze -- mī -- tē, ap -- raug' ma -- nu mū -- ža māj',
trai -- rī -- ri -- di ral -- lal -- lā, ap -- raug' ma -- nu mū -- ža māj'.
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


