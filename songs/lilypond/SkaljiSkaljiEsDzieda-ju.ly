\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Skaļi, skaļi es dziedāju",AA lapas
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
\repeat volta 2 {
\time 5/4
c4 g' e c2 |
f4 a a g2 |
\time 4/4
d4 g g e |
\time 5/4
f4 d c2. |
}
} 

lyricA = \lyricmode {
Ska -- ļi, ska -- ļi es dzie -- dā -- ju, uz kal -- ni -- ņa stā -- vē -- dam'
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


