\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kumeleni, kumeleni"
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
c8 c f f | a8 a a a | g8 g a8. g16 | f8 f f4
\repeat volta 2 {
g8. g16 g8. f16  | e8 e e4 |
d8 d e8. d16 | c8 c c4
}
} 



lyricA = \lyricmode {
Ku -- me -- le -- ni, ku -- me -- le -- ni, Tu maņ kau -- nu pa -- da -- rej’.
Trā -- di rī -- di ral -- la -- lā, Tu maņ kau -- nu pa -- da -- rej’.
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


