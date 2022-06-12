\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Veratiesi, Velu vārti",AA lapas, bēru dz.
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
\key d \minor
\time 2/4
d8 d d f |
g8 f e d |
\time 3/4
c8 e d4 d |
\time 2/4
f8 f e d |
\time 3/4
c8 e d4 d |
d8 c d2 |
\bar "|."
} 

lyricA = \lyricmode {
Ve -- ra -- tie -- si ve -- ļu vār -- ti, līdz pa -- ša -- mi ga -- li -- ņa -- mi,
līdz pa -- ša -- mi ga -- li -- ņam!
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


