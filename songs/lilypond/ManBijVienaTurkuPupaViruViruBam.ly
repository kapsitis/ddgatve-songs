\version "2.13.16"
%\header {
%    title = "Man bij viena turku pupa, viru, viru, bam"
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
\time 3/4
g8 g e'4 e |
d8 e f4 f |
\time 2/4 
g8. g16 g8 f 
}
\alternative { { e2| }{e4 r8 e8 | } }
d4 d8 e |
c4 c8 e |
d8 d c d |
c4 c8 e |
d4 d8 e |
c4 c8 e |
d8 d c d |
\time 3/4
c4 c r4 |
\bar "|."
} 

lyricA = \lyricmode {
Man bij' vie -- na tur -- ku pu -- pa, vi -- ru, vi -- ru, bam! 
bam! 
Pa pū -- ram, pa pū -- ram, pa tur -- ku pu -- pu pū -- ram, 
pa pū -- ram, pa pū -- ram, pa tur -- ku pu -- pu pū -- ram! 
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


