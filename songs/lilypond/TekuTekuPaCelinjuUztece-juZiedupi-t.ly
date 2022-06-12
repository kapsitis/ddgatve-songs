\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Teku, teku pa celiņu",AA lapas
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
f8 e c c |
d8 d d e |
f8 e d c |
d8 e d4 |
d8 e f a |
g8 f e d |
d8 a' g f |
e8 f d4
\bar "|."
} 

lyricA = \lyricmode {
Te -- ku te -- ku pa ce -- li -- ņu, uz -- te -- cē -- ju zied -- u -- pīt', 
Te -- ku te -- ku pa ce -- li -- ņu, uz -- te -- cē -- ju zied -- u -- pīt'.  
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


