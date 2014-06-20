\version "2.13.16"
%\header {
%    title = "Auseklītis jādelēja, malējiņas meklēdams",AA lapas, Šūpuļdziesmas
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
g'8 f e e |
g8 f e e |
e8 f e e |
f8 e g4 |
a8 g g g |
g8 f e4 |
a8 g g f |
e8 f g4 |
a8 g g e |
f8 e e4 |
\bar "|."
} 

lyricA = \lyricmode {
Au -- sek -- lī -- tis jā -- de -- lē -- ja, ma -- lē -- ji -- ņas mek -- lē -- dams,
Au -- sek -- lī -- tis jā -- de -- lēj, ma -- lē -- ji -- ņas mek -- lē -- dams,
ma -- lē -- ji -- ņas mek -- lē -- dams
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


