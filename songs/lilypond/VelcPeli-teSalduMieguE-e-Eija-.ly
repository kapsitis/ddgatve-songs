\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Velc, pelīte, saldu, miegu, ē - ē - eijā",AA lapas, Šūpuļdziesmas
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
\key g \major
\time 2/4
g8 b d d |
d8 b g g |
g'4 fis |
e4 d |
e8 e d c |
b8 a g a |
b4 a |
g4 g | 
\bar "|."
} 

lyricA = \lyricmode {
Velc, pe -- lī -- te, sal -- du mie -- gu, ē -- ē -- ei -- jā, ma -- za -- ja -- mi bēr -- ni -- ņa -- mi, ē -- ē -- ei -- jā! 
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


