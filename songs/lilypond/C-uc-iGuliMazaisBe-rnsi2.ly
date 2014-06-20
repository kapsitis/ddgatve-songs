\version "2.13.16"
%\header {
%    title = "Čuči, guli mazais bērnsi"
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
\repeat volta 2 {
c8 c e e g g g\fermata g |
g8 g a d, f g e\fermata e |
c8 c e e g g g\fermata g |
g8 g g d f g e\fermata e |
}
} 

lyricA = \lyricmode {
Ču -- či, gu -- li ma -- zais bērn -- si 
Kā pe -- lī -- te mi -- dzi -- ņā -- i.
Ču -- či, gu -- li ma -- zais bērn -- si 
Kā pe -- lī -- te mi -- dzi -- ņā -- i.
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


