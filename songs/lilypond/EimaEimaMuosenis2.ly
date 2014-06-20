\version "2.13.16"
%\header {
%    title = "Eima, eima, muosenis"
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
\key f \major
\time 2/4
\slurDashed
f8 f f g | a4 a8[( a]) | g8 bes a g | a4. g8 |
f8 f f a | g4 g8[( f]) | e8 e d e | f4 c
\bar "|."
} 



lyricA = \lyricmode {
Ei -- ma, ei -- ma, muo -- se-nis, Pa u -- pei -- tis mo -- lu.
Ei -- ma, ei -- ma, muo -- se-nis, Pa u -- pei -- tis mo -- lu.
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


