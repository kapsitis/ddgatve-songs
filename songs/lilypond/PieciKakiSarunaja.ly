\version "2.13.16"
%\header {
%    title = "Pieci kaķi sarunāja"
%}
% F/g "Laiva", rokraksts - balta_mape2.pdf, p.26
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
\time 2/4
\clef "treble"
\key c \major
\time 2/4
\override Voice.TextScript #'font-family = #'sans
\override Voice.TextScript #'font-size = #-1

\phrasingSlurDashed
g'8^"do" g^"do" d\(^"sol" d\)^"sol" | 
e8^"do" e^"do" f\(^"fa" f\)^"fa" | 
e8^"do" g^"do" d^"sol" d^"sol" | 
c8^"do" c^"do" c4^\markup{\underline "do"}

g'4^\markup{\underline "do"} d^\markup{\underline "sol"} | 
e8^"do" e^"do" f4^\markup{\underline "fa"} | 
e8^"do" g^"do" d^"sol" d^"sol" | 
c8^"do" c^"do" c4^\markup{\underline "do"}
\bar "|."
} 


lyricA = \lyricmode {
Pie -- ci ka -- ķi sa -- ru -- nā -- ja 
put -- ru vā -- rīt va -- ka -- rā. 
Ņau, ņau, ņau, ņau, ņau, put -- ru vā -- rīt va -- ka -- rā.
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


