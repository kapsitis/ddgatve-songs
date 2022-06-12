\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Es uzkāpu kalniņāi"
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
g8 g c c |
b8 a g g |
c4 d |
\repeat volta 2 {
g4 g |
d8 e d c |
b8 a g f' |
e8[ d] c4 |
}
}

lyricA = \lyricmode {
Es uz -- kā -- pu kal -- ni -- ņā -- i, lī -- go, lī -- go, put -- nu dzies -- mas klau -- sī -- tie -- si, lī -- go.
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


