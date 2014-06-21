\version "2.13.16"
%\header {
%    title = "Aizej, lietiņ, rūkdams kaukdams"
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
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 4/4 \mark \markup {  \circle \bold A }
d4 g f d8[ e] | \mark \markup {  \circle \bold B }
f4 e d d |
d4 g f d8[ e] |
f4 e d d |
d4 g f d8 e |
f8 e d e d2 |
\bar "|."
} 


lyricA = \lyricmode {
Ai -- zej, lie -- tiņ, rūk -- dams, kauk -- dams aiz tiem jū -- ras lie -- liem vaļ -- ņiem, 
at -- nāc, Sau -- lī -- te, spī -- gu -- ļo -- da -- ma! 
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



