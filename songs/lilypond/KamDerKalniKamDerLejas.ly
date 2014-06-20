\version "2.13.16"
%\header {
%    title = "Kam der kalni, kam der lejas"
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
\time 4/2
c8 d e f g g g g c c d d c16[ b] a8 g b |
c8 c b8. a16 a b c a g8. e16 f8 d e g d d c4
\bar "|."
} 

lyricA = \lyricmode {
Kam der kal -- ni, kam der le -- jas, 
Kam der za -- ļi o -- zo -- li -- ņi?
Ok -- tai -- rī -- di ri -- di -- ri -- di -- rī -- di, 
Kam der za -- ļi o -- zo -- liņ'?
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



