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
es1 f2:min bes:7 es as c:min f:min
}

voiceA = \relative c'' {
\clef "treble"
\key c \minor
\time 4/4
%\dynamicUp

g8 g g as g4 g8 g16 g | bes8 [(as]) as [(bes]) g4 (f) | g8 bes es, es g bes es, es | es4 es (f2) \bar"|." 
}

lyricA = \lyricmode {
Kungs mans Jē -- zu Kris -- tu, Dzī -- vā Die -- va Dēls, ap -- žē -- lo -- jies, ap -- žē -- lo -- jies par mums.
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


