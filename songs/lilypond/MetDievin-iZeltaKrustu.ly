\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = " Met, Dieviņi, zelta krustu ap šo visu istabiņu"
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
e8 g g8. g16 |
a8 g g8. f16 |
e8 g g8. g16 |
\phrasingSlurDashed
a8 g g8\( e8\) |
f8 f e8. e16 |
d8 d e8. e16 |
f8 f e8. e16 |
d8 d e4 |
\bar "|."
} 


lyricA = \lyricmode {
 Met, Die -- vi -- ņi, zel -- ta krus -- tu pār šo vi -- su is -- ta -- bi -- ņu,
 met, Die -- vi -- ņi, zel -- ta krus -- tu pār šo vi -- su is -- ta -- biņ.
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



