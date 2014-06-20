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
s4 e1:min a2:min d g c a:min6 b e1:min a2:min d g:6 a:min e1:min
}

voiceA = \relative c'{
\clef "treble"
\key e \minor
\time 4/4
\partial 4

b4 |\repeat volta 2 { b'8 b4 b8 b4. g8 | a4 a8 a a2 | g4. a8 g4 g | fis4. g8 fis4. b,8 | b'4 b8 b b4. g8 | a4 a8 a a2 | g4. g8 fis e4 dis8 | e2 r4 b
}
}
lyricA = \lyricmode {
Kungs,
uz -- klau -- si mūs, Kungs, uz -- klau -- si mūs, kad mēs sau -- cam, at -- bil -- di. Kungs, uz -- klau -- si mūs, Kungs, uz -- klau -- si mūs, nāc un mie -- ri -- ni mūs. Kungs,
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