\version "2.13.16"
%\header {
%    title = "Treis jaunys muosys"
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
\time 6/8
d8 d f a4 a8 | bes8 a g a4 f8 |
g8 f e f e d | a'4.~ a4 r8 |
c8 bes a g4 g8 | d'8 c d a4 f8 |
g8 f e f e d | a'4.~ a4 r8
\bar "|."
} 

lyricA = \lyricmode {
Treis jau -- nys muo -- sys
Sēd rū -- žu duor -- zā,
Ai -- jai  -- jā, tral -- la -- lā lā.
Treis jau -- nys muo -- sys
Sēd rū -- žu duor -- zā,
Ai -- jai -- jā, tral -- la  -- lā lā.
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



