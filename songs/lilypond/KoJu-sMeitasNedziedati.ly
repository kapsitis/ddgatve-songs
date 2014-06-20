\version "2.13.16"
%\header {
%    title = "Ko jūs meitas nedziedati"
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
e8 d c c |
a'8 g g e |
a8 g g e |
f8 d c c |
e4 c |
a'8 g g[ e] |
a8 g g e |
f8 d c4 |
\bar "|."
} 


lyricA = \lyricmode {
Ko jūs mei -- tas ne -- dzie -- da -- ti, vai jums ro -- zes ne -- zie -- dē -- ja;
ei -- jā, ral -- lal -- lā, vai jums ro -- zes ne -- zie -- dēj'?
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



