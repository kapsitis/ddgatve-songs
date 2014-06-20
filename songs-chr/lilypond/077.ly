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
g4 a:min e:min d2 b4:min d e2:min c d4 d2:7 g
}

voiceA = \relative c''{
\clef "treble"
\key e \minor
\time 4/4
\partial 4

b8 b
\repeat volta 2 {
\stemUp c4 (b a) a8 a | b4 (a g) g8 g | \time 3/4 a8 g g g fis g | \time 4/4 b4. (a8 g4) \stemNeutral b8 b
}
}

lyricA = \lyricmode {
In -- stau -- ra______-________re, In -- stau -- ra______-_______re, In -- stau -- ra -- re om -- ni -- a in Chris________-________to. In -- stau-
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