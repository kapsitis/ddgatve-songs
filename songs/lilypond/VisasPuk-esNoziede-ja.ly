\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Visas puķes noziedēja",Laiva, Jāņi
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
\repeat volta 2 {
\time 2/4
b8 c d c |
b8 c d c |
d4 b |
b4 d |
b8 c d c |
b8 c d c |
d4 b |
b4 d |
}
} 

lyricA = \lyricmode {
Vi -- sas pu -- ķes no -- zie -- dē -- ja, lī -- go, lī -- go, Pa -- par -- dī -- te ne -- zie -- dē -- ja, lī -- go, lī -- go.
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


