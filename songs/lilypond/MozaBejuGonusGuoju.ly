\version "2.13.16"
%\header {
%    title = "Moza beju, gonūs guoju"
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


voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 2/4
a8 g f e | d8 d d d | c8 c d e | f8 f f4
\repeat volta 2 {
a8 a a4 | bes8 bes bes4 | c8 c c bes | a8 a a4
}
}


lyricA = \lyricmode {
Mo -- za be -- ju, go -- nūs guo -- ju,
Muo -- lu ne -- šu ku -- lei -- tē.
Ai -- ja -- jā, tral -- la -- lā,
Muo -- lu ne -- šu ku -- lei -- tē.
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


