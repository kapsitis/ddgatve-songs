\version "2.13.16"
%\header {
%    title = "Nav skaitā lieli mūsu pulki"
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
\time 3/4
\partial 4*1
a8 a16 a | d4. d8 e d | d4 cis a8 a16 a | e'4. e8 fis e |
d4~ d d16 d fis8 | a4. a8 b b | a4 fis a,8 a16 a | e'4. g8 fis e | d4~ d r
\bar "|."
} 

lyricA = \lyricmode {
Nav skai -- tā lie -- li mū -- su pul -- ki, 
Bet liels ir vi -- ņu brī -- vais gars. 
Var lep -- ni teikt: jau dro -- ši sve -- ras 
Uz mū -- su pu -- si lik -- teņ -- svars.
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


