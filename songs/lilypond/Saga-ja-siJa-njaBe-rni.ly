\version "2.13.16"
%\header {
%    title = "Sagājasi Jāņa bērni",AA lapas, Jāņi
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
c8 e c e |
f8 e d c |
c8 e c e |
f8 e d c |
d8 f e c |
d8 d d4 |
d8 f e c |
d8 d c4 |
\bar "|."
} 

lyricA = \lyricmode {
Sa -- gā -- jā -- si Jā -- ņa bēr -- ni,
sa -- de -- vā -- si ro -- ci -- ņā -- si,
sa -- gā -- jā -- si Jā -- ņa bērn',
sa -- de -- vā -- si ro -- ci -- ņās
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


