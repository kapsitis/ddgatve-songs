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
s4 f1 bes c f
}

voiceA = \relative c' {
\clef "treble"
\key f \major
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 4/4
\partial 4

\mark \markup {\circle \bold 1} 
c4 | f2 a4 f | d2. d4 | e2 g4 e | c2. \mark \markup {\circle \bold 2} 
c4 | c'1| d4 c bes a | g2 a4 (bes) | a2. \mark \markup {\circle \bold 3} 
a4 | a1 | bes4 a g f | e2 f4 (g) | f2. \bar"|."
}

lyricA = \lyricmode {
Dievs do -- mā par mums, Dievs do -- mā par mums, tas Kungs ir ar mums un svē -- tī mūs,
tas Kungs ir ar mums un svē -- tī mūs.
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


