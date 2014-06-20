\version "2.13.16"
%\header {
%    title = "Tā jāj kungi",AA lapas
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
\key d \major
\time 2/4
d8 d d d |
d8 d d d |
d8 d d d |
d8 d d4 |
d4 d |
d4 d |
d8 d d d |
d8 d d4 |
} 

lyricA = \lyricmode {
Tā jāj kun -- gi, tā jāj kal -- pi, tā tie kun -- ga su -- lai -- nīš': Dop, dop, dop, dop, tā tie kun -- ga su -- lai -- nīš'.
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


