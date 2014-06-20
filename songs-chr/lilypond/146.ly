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

chordsA = \chordmode {
d1 g a:7 d d g a:7 d d g a:7 d
}

voiceA = \relative c' {
\clef "treble"
\key d \major
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 4/4

\mark \markup {\circle \bold 1 }
d4 d8 d d4. fis8 | fis2. e4 | e4. e8 e4 cis | d2 d \bar"||"
\mark \markup {\circle \bold 2 }
fis4 fis8 fis  fis4. a8 | a2. g4 | g4. g8 g4 e | fis2 fis \bar"||"
\mark \markup {\circle \bold 3 }
a4. d8 d4. cis8 | cis2 b4. b8 | b4. b8 b4 gis | a2 a \bar"|."
}

lyricA = \lyricmode {
Pil -- nī -- gi es -- mu Tavs, Ma -- ri -- ja, ma -- na Mā -- te.
Viss, kas ir mans, ir Tavs, Ma -- ri -- ja, mī -- ļā Mā -- te.
Va -- di vien -- mēr ma -- ni Ma -- ri -- ja, Die -- va Mā -- te.
}


fullScore = <<
\new ChordNames { \chordsA }
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


