\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Labvakari rudzu lauksi",AA lapas, Jāņi
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
g8 c c d |
e8 d c g |
\time 4/4
c4 d e d8 c |
\time 2/4
c8 e d c |
e8 d c g |
\time 3/4
c4 d2 |
c4 c2 |
\bar "|."
} 

lyricA = \lyricmode {
Lab -- va -- ka -- ri ru -- dzu lauks -- i, lī -- go Jā -- nī -- ti,
kā Die -- vi -- ņis tev lī -- dzē -- ja, lī -- go, lī -- go.
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


