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

%chordsA = \chordmode {}

voiceA = \relative c' {
\clef "treble"
\key a \minor
\time 4/4

e4 e8 e8 e4 a8 b | c4 c8 b a4 a | g g8 g g4 b8[(g]) | a2.. b16[( b]) 
\time 2/4 c4 r8 d16[( c]) | b4 r8 a16[( g]) 
\time 4/4 e'([d] e2) r4 a, 16 ([b]) | c4 r8 d16 ([c]) b8 a4 (gis8) | a2. r4 \bar"|."
}

lyricA = \lyricmode {
Mie -- rī -- gu nak -- ti un svē -- tī -- gu rī -- tu, pie -- šķir mums, spē -- cīgais Dievs. A -- men, a -- men, a -- men, a -- men, a -- men, a -- men.
}


fullScore = <<
%\new ChordNames { \chordsA }
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


