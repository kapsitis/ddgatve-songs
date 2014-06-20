\version "2.13.16"
%\header {
%    title = "Aizalaida Sauleite"
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
g'16 g g g g8 e16 g | a8 a g( a16) g |
f16 e f a g8 a16 f | e8 e16( d) c8 c 
\bar "|."
} 



lyricA = \lyricmode {
Ai -- za -- lai -- da sau -- lei -- te aiz kaļ -- ne -- ņa,
Ai -- za -- sā -- da An -- nei -- te aiz gaļ -- de -- ņa. 
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


