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
s8 d4.:min a2 d:min c f c d4:min a d2:min
}

voiceA = \relative c' {
\clef "treble"
\key d \minor
\time 4/4
%\dynamicUp

r8 f f f e e e4 | f f g2 | a4. a8 c4 g | f e d2 \bar"|."
}

lyricA = \lyricmode {
Mi -- se -- ri -- cor -- di -- as Do -- mi -- ni in ae -- ter -- num can -- ta -- bo.
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


