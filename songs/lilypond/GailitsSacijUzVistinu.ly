\version "2.13.16"
%\header {
%    title = "Gailīts sacīj' uz vistiņu"
%}
% F/g "Laiva", rokraksts - dzeltena_mape.pdf, p.7
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
g8 c c c | b8 c d d | g,8 d' d d | c8 d e4
\phrasingSlurDashed
f8 f a\( a\) | e8 e g\( g\) | d8 d g8. f16 | e8 d c4   
\bar "|."
} 


lyricA = \lyricmode {
Gai -- līts sa -- cīj' uz vis -- ti -- ņu:
kur mēs a -- bi gu -- lē -- sim? 
Gai -- līts sa -- cīj' uz vis -- ti -- ņu:
kur mēs a -- bi gu -- lē -- sim? 
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


