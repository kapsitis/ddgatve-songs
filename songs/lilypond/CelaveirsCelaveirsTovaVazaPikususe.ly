\version "2.13.16"
%\header {
%    title = "Ceļaveirs, ceļaveirs, tova vāza pīkususe"
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
g'8\fermata f e c e e e f | g8 f e c e e e4
f8 f f4  g8 g g4 | a8 f d b c c c4
f8 f f f g g g g | a8 a a a g g g g |
f8 f f f e g g g | a8 f d b c c c4
\bar "|."
} 



lyricA = \lyricmode {
Ce -- ļa -- vei -- rys, ce -- ļa -- vei -- rys, To -- va vā -- za pī -- ku -- sus',
Ce -- ļa -- veirs, ce -- ļa -- veirs, To -- va vā -- za pī -- ku -- sus'.
At -- sa -- sēs -- ti uz e -- že -- nis, At -- pyu -- ti -- ni ce -- ļa vā -- zu. 
At -- sa -- sēs -- ti uz e -- že -- nis, At -- pyu -- ti -- ni ce -- ļa vāz'.
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


