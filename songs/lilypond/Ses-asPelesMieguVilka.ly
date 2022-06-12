\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Sešas peles miegu vilka mazajami bērniņam",AA lapas
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
\time 2/4
c8 c e e |
a8 g g e |
g8 g g f |
e8 e e4 |
}
} 

lyricA = \lyricmode {
Se -- šas pe -- les mie -- gu vil -- ka ma -- za -- ja -- mi bēr -- ni -- ņam,
se -- šas pe -- les mie -- gu vil -- ka ma -- za -- ja -- mi bēr -- ni -- ņam.
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


