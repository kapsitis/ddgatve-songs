\version "2.13.16"
%\header {
%    title = "Lien, pelīte, pār zemīti",AA lapas, bēres
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
\time 3/4
c4 g' f8 d |
\time 4/4
e4 d c4. c8 |
\time 3/4
c4 g' f8 d |
\time 4/4
e4 d c2 |
\time 3/4
c4 c f8 f |
\time 4/4
a4 a g4. e8
\time 3/4
c4 g' f8 d |
\time 4/4
e4 d c2 |
\bar "|."
} 

lyricA = \lyricmode {
Lien, pe -- lī -- te, pār ze -- mī -- ti, lien, pe -- lī -- te, pār ze -- mīt',
ap -- raug' ma -- nu mū -- ža mā -- ju, ap -- raug' ma -- nu mū -- ža māj'.
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


