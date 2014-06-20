\version "2.13.16"
%\header {
%    title = "Aiz kalniņa meitas dzieda",AA lapas, 
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
\key a \minor
\time 3/4
a8 b c4. b8 |
d8 c b[ c] a4 |
a8 a a'4. e8 |
g8 f  e[ f] e4 |
a,8 c d4. c8 |
d8 b a2 |
\bar "|."
} 

lyricA = \lyricmode {
Aiz kal -- ni -- ņa mei -- tas dzie -- da, aiz mig -- li -- ņas ne -- re -- dzē -- ju,
aiz mig -- li -- ņas ne -- re -- dzēj'
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


