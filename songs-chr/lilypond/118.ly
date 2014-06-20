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
s4 d2. d:sus4 d a
}

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 3/4
%\dynamicUp
\partial 4

e4
\repeat volta 2 { fis4 fis \times 2/3 {fis8 e fis} | g4 g g | fis fis \times 2/3 {fis8 e d} | e4 e e }
}

lyricA = \lyricmode {
O Chris -- te Do -- mi -- ne Je -- su, o Chris -- te Do -- mi -- ne Je -- su. O
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


