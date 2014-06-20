\version "2.13.16"
%\header {
%    title = "Saule savus kumeliņus"
%}
% Budēlīši, p.24
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

g'8. f16 e[ d] c8 | 
f8 g a f | 
g8 c e, e |
d8 d c4 |
f8 a g e |
d8 d c4
\bar "|."
}


lyricA = \lyricmode {
Sau -- le sa -- vus ku -- me -- li -- ņus Jū -- ri -- ņā -- i pel -- di -- nāj';
Jū -- ri -- ņā -- i pel -- di -- nāj'.
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


