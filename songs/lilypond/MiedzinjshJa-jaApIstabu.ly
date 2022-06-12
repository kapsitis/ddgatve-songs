\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Miedziņš jāja ap istabu",AA lapas, Šūpuļdziesmas
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
c8 e c e |
e8 d d d |
d8 f f f |
f8 e e4 |
c8 e c e |
e8 d d d |
g8 g f d |
c8 c c4 |
\bar "|."
} 

lyricA = \lyricmode {
Mie -- dziņš jā -- ja ap is -- ta -- bu dā -- bu -- lai -- nu ku -- me -- liņ',
Mie -- dziņš jā -- ja ap is -- ta -- bu dā -- bu -- lai -- nu ku -- me -- liņ'.
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


