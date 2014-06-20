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

voiceA = \relative c'' {
\clef "treble"
\key g \major
\time 2/4

\repeat volta 2 {b8 g e4 | c'8 a fis4 | d'8 b g a}
\alternative {
  {a4 b}
  {fis4 g \bar"|."}
}
}

lyricA = \lyricmode {
\set stanza = #"1./3. "
Ky -- ri -- e, Ky -- ri -- e, Ky -- ri -- e e -- lei -- son. -lei -- son.
}
lyricB = \lyricmode {
\set stanza = #"2. "
Chris - te, Chris - te, Chris - te e -- lei -- son. -lei -- son.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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

