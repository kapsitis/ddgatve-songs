\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.92
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 6/8
\repeat volta 2 {a8 c c d g,4 | bes8 bes bes c a4}
\repeat volta 2 {a8 g f e16 [d] c8 c | bes' bes a16 [bes] c8 a4}
}

lyricA = \lyricmode {
\set stanza = "1. "
Tys vē -- jeņš pyu -- ta, pui -- sāns dan -- cuo -- ja, tei jau -- na mei -- te -- ņa gau -- ži rau -- duo -- ja.
}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
%\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
>>
}
>>



\score {
\fullScore
\header { piece = "__" opus = "__" }
}
\markup { \with-color #(x11-color 'white) \sans \smaller "__" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}


