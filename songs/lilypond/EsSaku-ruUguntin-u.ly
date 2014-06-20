\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas, Lieldienas
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4 
\phrasingSlurDashed
c8 c c\( c\) |
d8 c c c |
c8 c e d |
d8 c c4 |
d8 d e d |
d8 c c c |
c8 c e d |
d8 c c4|
\bar"|."
}

lyricA = \lyricmode {
Es sa -- kū -- ru u -- gun -- ti -- ņu no de -- vi -- ņi ža -- ga -- riņ',
Es sa -- kū -- ru u -- gun -- ti -- ņu no de -- vi -- ņi ža -- ga -- riņ'.

}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
%\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


