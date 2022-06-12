\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.74a
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\repeat volta 2 { \time 3/4 c'8 b a4. c16 [a] | \time 4/4 g8 a b4. (g8) e4 }
\repeat volta 2 { \time 3/4 f8 e d4. c'8 }
\alternative {
{ \time 4/4 b a e2 e4}
{ b'8 a e2. \bar"|." }
}
}

lyricA = \lyricmode {
\set stanza = "1. "
Treis put -- ne -- ni smu -- ki dzī -- de smol -- kā loz -- du kryu -- me -- ņā -- i, kryu -- me -- ņā.
}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
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


