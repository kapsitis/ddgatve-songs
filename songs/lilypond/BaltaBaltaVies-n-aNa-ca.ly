\version "2.13.16"
%\header {
%    title = "Balta, balta viešņa nāca"
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
c8 e e e |
f16[ e] d8 c c |
g'4 a |
g2 |
d8 a' g f |
e8 d c a |
d4 c8 r8 |
\bar "|."
} 


lyricA = \lyricmode {
Bal -- ta, bal -- ta vieš -- ņa nā -- ca, ē ē ē, pus -- va -- ka -- ra sau -- lī -- tē -- i, ē e!
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



