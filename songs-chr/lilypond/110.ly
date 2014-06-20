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
d4. a:7 d2. d4. a:7 d2. d4. a:7 d2. fis4.:min g d a:7 d1. g4. d a2.:7 d1.}

voiceA = \relative c'{
\clef "treble"
\key d \major
\time 12/8

fis4. e d2. | fis4. e d2. | fis4. e d~d4 fis8 | a4. g fis e |
fis2. fis4. r4 d8 | g4. fis e~ e4 d8 | d2. d \bar"|."
}

lyricA = \lyricmode {
Jē -- zu, mans Pes -- tī -- tāj un mans Kungs! Es ne -- at -- stā -- šu Te -- vi.
Es ne -- at -- stā -- šu Te -- vi.
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