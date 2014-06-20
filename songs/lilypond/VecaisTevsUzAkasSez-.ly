\version "2.13.16"
%\header {
%    title = "Vecais tēvs uz aku sēž",AA lapas
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
a8 a a8. a16 |
fis'8 fis fis4 |
g8 e e e |
fis8 d d4 |
e8 e e8. e16 |
e8 d  cis[ b] |
a8 a b cis |
d8 d d4 |
}
 

lyricA = \lyricmode {
Ve -- cais tēvs uz a -- ku sēž pu -- pu ku -- le mu -- gu -- rā, ve -- cais tēvs uz a -- ku sēž pu -- pu ku -- le mu -- gu -- rā.
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


