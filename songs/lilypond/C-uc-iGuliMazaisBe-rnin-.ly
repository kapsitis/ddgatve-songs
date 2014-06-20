\version "2.13.16"
%\header {
%    title = "Čuči, guli, mazais bērniņ"
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
c4 c e8 c | d4 d f8 d | g4 g g8 f |
\time 4/4
e4 c g'4. e8 | 
\time 3/4
d4 d f8 d | c4 c e8 c | d4 d f8 d |
\time 4/4
c4 b c2 
\bar "|."
} 

lyricA = \lyricmode {
Ču -- či, gu -- li, ma -- zais bēr -- niņ 
līdz pu -- ķī -- tes sa -- la -- sī -- tas, 
Ču -- či, gu -- li, ma -- zais bēr -- niņ 
līdz pu -- ķī -- tes sa -- la -- sīt's. 
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


