\version "2.13.16"
%\header {
%    title = "Skauģim auga apses birze",AA lapas
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
\key d \major
\repeat volta 2 {
\time 2/4
d8\fermata e a, a |
fis'8 fis g g |
fis8 d e e |
d16[ cis] b8 a4 |
}
} 

lyricA = \lyricmode {
Skau -- ģim au -- ga ap -- ses bir -- ze, man aug bē -- ri ku -- me -- liņ'
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


