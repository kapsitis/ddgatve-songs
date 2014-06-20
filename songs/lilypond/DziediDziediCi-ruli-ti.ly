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


voiceA = \relative c'{
\clef "treble"
\key c \major
\time2/4
\repeat volta 2 {
e8 c f e |
e8 c f e |
e8 d d8. e16|
d8 c c4|
} 
}

lyricA = \lyricmode {
Dzie -- di, dzie -- di, cī -- ru -- lī -- ti, nā -- ci, nā -- ci va -- sa -- riņ'!
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


