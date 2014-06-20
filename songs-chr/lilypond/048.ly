\version "2.13.18"

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

%chordsA = \chordmode {}

voiceA = \relative c' {
\clef "treble"
\key d \major
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 4/4

\mark \markup {\circle \bold 1 }
d2 e4 fis | fis2 e | e fis4 g | g2 fis | a (g4) fis | b2 a4 d, | fis2. (e4) | d1 |
\mark \markup {\circle \bold 2 }
a'1 | a | a | a | a4 (b cis) d | d2 fis,4 g | a1 | fis | 
\mark \markup {\circle \bold 3 }
fis2 e4 d | d2 cis | g' fis4 e | e2 d | cis4 (d e) d | b (g') fis b, | d2 (cis) | d1 \bar"|."
}

lyricA = \lyricmode {
A -- ve Ma -- ri -- a, a -- ve Ma -- ri -- a, a -- ve, a -- ve Ma -- ri -- a.
A -- ve, a -- ve, a -- ve, a -- ve Ma -- ri -- a.
A -- ve Ma -- ri -- a, a -- ve Ma -- ri -- a, a -- ve, a -- ve Ma -- ri -- a.
}


fullScore = <<
%\new ChordNames { \chordsA }
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
\markup { \with-color #(x11-color 'white) \sans \smaller "aaa" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}


