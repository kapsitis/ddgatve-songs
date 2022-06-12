\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Es uzgāju sev priekšāi",AA lapas, Jāņi
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
c8 d f e |
f8 e d e |
\time 3/4
c4 e2 |
d4 c2 |
\time 2/4
c8 c f e |
f8 e d c |
\time 3/4
c4 e2 |
d4 c2 |
\bar "|."
} 

lyricA = \lyricmode {
Es uz -- gā -- ju sev priek -- šā -- i, lī -- go, lī -- go, zie -- du pļa -- vu ne -- no -- pļau -- tu, lī -- go, lī -- go.
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


