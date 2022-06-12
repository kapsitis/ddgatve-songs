\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Dziesmiņ' mana padziedama"
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
\time 3/4
c4 e e8 d |
\time 4/4
f4 e d4. c8 |
\time 3/4
b4 d d8 c |
\time 4/4
e4 d c4. d8 |
\time 3/4
c4 e e8 d |
\time 4/4
f4 e d4. c8 |
\time 3/4
b4 d d8 c |
\time 4/4
e4 d d2 |

\bar "|."
} 


lyricA = \lyricmode {
Dzies -- miņ' ma -- na pa -- dzie -- da -- ma, ne tā ma -- nis da -- ri -- nā -- ta,
ai -- da -- ri -- di ral -- lal -- lā -- i, ne tā ma -- nis da -- ri -- nāt'. 
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



