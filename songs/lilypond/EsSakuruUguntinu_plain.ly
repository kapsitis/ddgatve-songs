\version "2.13.16"
%\header {
%    title = "Es sakūru uguntiņu"
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
\key d \minor
\time 4/4
f8 f e d e d d4 | f8 f e d e d d4 |
c8 c c c c d d4 | c8 c c c c d d4 
f8 f e d e d d4\fermata 
\bar "|."
} 



lyricA = \lyricmode {
Es sa -- kū -- ru u -- gun -- tiņ' no de -- vi -- ņi ža -- ga -- riņ'.
Es sa -- kū -- ru u -- gun -- tiņ' no de -- vi -- ņi ža -- ga -- riņ,
no de -- vi -- ņi ža -- ga -- riņ'.
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



