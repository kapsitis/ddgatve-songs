\version "2.13.16"
%\header {
%    title = "Rijiņai, platspārnei",AA lapas, darba dziesmas
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
\time 4/4
e8 d c c e d c4 |
c8 e e e e d c4 |
e8 d c g c c d4 |
c8 d d d d c d4 |
c8 e e e d b c4 |
\bar "|."
} 

lyricA = \lyricmode {
Ri -- ji -- ņa -- i, plat -- spār -- nei, tai de -- vi -- ņi kū -- lē -- jiņ',
ri -- ji -- ņa -- i, plat -- spār -- nei, tai de -- vi -- ņi kū -- lē -- jiņ',
tai de -- vi -- ņi kū -- lē -- jiņ'.
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


