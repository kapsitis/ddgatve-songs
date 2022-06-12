\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Pele brauc, rati čīkst"
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
\time 4/4
e8 c e4 e8 c e4 | e8 e f8. e16 e8 d d r | 
d8 b d4 d8 b d4 | d8 d e8. d16 d8 c c r 
}
} 

lyricA = \lyricmode {
Pe -- le brauc, ra -- ti čīkst ap to mie -- ga ve -- zu -- miņ', 
Pe -- le brauc, ra -- ti čīkst ap to mie -- ga ve -- zu -- miņ', 
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


