\version "2.13.16"
%\header {
%    title = "Maziņos putniņus Vējmāte šūpo",AA lapas
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
\time 3/8
g'8 e g |
f8 d f |
e8 c e |
d8 c4 |
f8 d f |
e8 c e |
d8 e d |
c8 c4 |
\bar "|."
} 

lyricA = \lyricmode {
Ma -- zi -- ņos put -- ni -- ņus Vēj -- mā -- te šū -- po,
Kal -- ni -- ņa ga -- li -- ņā, bēr -- zi -- ņa za -- rā.
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


