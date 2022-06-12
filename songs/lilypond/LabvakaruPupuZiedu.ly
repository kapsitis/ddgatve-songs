\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Labvakaru, pupu ziedu",AA lapas, Jāņi
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
c8 f f f |
f8 e e e |
c8[ g'8] g4 |
g4 f8 f |
e8 g g g |
g8 f e e |
\time 3/4
c4 g'2 |
f4 e2 |
\bar "|."
} 

lyricA = \lyricmode {
Lab -- va -- ka -- ru, pu -- pu zie -- du, lī -- go, Jā -- nī -- ti,
kā Die -- vi -- ņis tev lī -- dzē -- ja, lī -- go, lī -- go
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


