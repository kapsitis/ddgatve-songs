\version "2.13.16"
%\header {
%    title = "Aijā, žūžū, mazais bērniņ"
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
\time 2/4
\repeat volta 2 {
f4 d8 d |
d4 d |
c4 d8[ c] |
d4 d |
}
\repeat volta 2 {
f4 f8 f |
g4 g |
d4 f |
e8[ d] d4 |
} 
}

lyricA = \lyricmode {
Mīl ka -- trs bal -- tu mai -- zes ri -- ku, es mī -- lu lau -- ku ru -- dens pli -- ku.
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


