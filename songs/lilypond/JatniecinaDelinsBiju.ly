\version "2.13.16"
%\header {
%    title = "Jātnieciņa dēliņš biju"
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


voiceA = \relative c'' {
\clef "treble"
\key c \major
\time 2/4
c8-. b-. c-. b-. |
c8-. b-. a-. g-. |
e'4 f8[ e] |
d4. f8 |
e8-. e-. d-. b-. |
c-. b-. a-. g-. |
c4 d |
g,4. f'8 |
e8-. e-. d-. b-. |
c-. b-. a-. g-. |
c4 d |
g,2
\bar "|."
} 

lyricA = \lyricmode {
Jāt -- nie -- ci -- ņa dē -- liņš bi -- ju, dē -- liņš bi -- ju, 
Jā -- ju die -- nu, jā -- ju nak -- ti, jā -- ju nak -- ti, 
Jā -- ju die -- nu, jā -- ju nak -- ti, jā -- ju nakt'.
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



