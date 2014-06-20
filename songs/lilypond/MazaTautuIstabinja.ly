\version "2.13.16"
%\header {
%    title = "Aiz kalniņa dūmi kūp"
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
c8^"Runas ātrumā" c d d |
e8 d d d |
d8 c c c |
c8 c c c |
c8 d e d |
d8 d d d |
d8 c e d |
d8 d d4 |
c8 d e d |
d8 d c4 |
\bar "|."
} 

lyricA = \lyricmode {
Ma -- za tau -- tu is -- ta -- bi -- ņa, tre -- ju dur -- vju iz -- da -- rī -- ta.
Ma -- za tau -- tu is -- ta -- bi -- ņa, tre -- ju dur -- vju iz -- da -- rīt', tre -- ju dur -- vju iz -- da -- rīt'.   

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


