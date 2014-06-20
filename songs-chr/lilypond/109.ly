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
s4 f2. d4:min f2. c4:7 f2. bes4 f1 f1. s4 g:7 c1. s4 f c2. f1 c4 bes1 f f2. d4:min c1:7 f1. s4
}

voiceA = \relative c'{
\clef "treble"
\key f \major
\time 4/4
\partial 4

c8[ f] |
\repeat volta 2 {f2. \times 2/3 {a8[ g f]} | a2. g4 | f2. d4 | c2. c8[ f] | f2. \times 2/3 {a8[ g f]} | a2. g4 | c1~ |
c2. a8[ c] | c2. \times 2/3 {a8[ g f]} | a2. g4 | f2. d4 | c2. c8[ f] | f2. \times 2/3 {a8[ g f]} | a2. g4 | f1~ | f2.\fermata c8[ f]}
}

lyricA = \lyricmode {
Jē -- zu, Jē -- zu, Jē -- zu, Jē -- zu, Jē -- zu, Jē -- zu, Jē -- zu, 
Jē -- zu, Jē -- zu, Jē -- zu, Jē -- zu, Jē -- zu, Jē -- zu, Jē -- zu! Jē_-
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