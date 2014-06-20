\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.134
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key c \major
\time2/4
g8 f e f |
d8 f e e |
g8 f e e |
d8 f e4 |
d8 d e d |
e8 d c c |
d8 d e d |
e8 d c4 |
\bar "|."  
}

lyricA = \lyricmode {
Vi -- su ga -- du es gai -- dī -- ju Liel -- die -- ni -- ņu at -- nā -- kam, vi -- su ga -- du es gai -- dī -- ju Liel -- die -- ni -- ņu at -- nā -- kam.

}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
%R\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


