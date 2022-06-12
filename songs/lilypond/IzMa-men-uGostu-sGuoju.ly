\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.122
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 3/4
\repeat volta 2 {f4 f8 [g] a a | g f g4 (a8) g }
\repeat volta 2 {d4 d8 [e] f f}
\alternative {
{e d c4 (f8) e}
{e d c2 \bar"|."}
}
}

lyricA = \lyricmode {
\set stanza = "1. "
Iz mā -- me -- ņu gos -- tūs guo -- ju,
ce -- ļa la -- bi na -- zy -- nuo -- ju, na -- zy -- nuoj.
}

voiceB= \relative c' {
\clef "treble"
\key f \major
\time 3/4
\repeat volta 2 {f4 f8 [e] f f | e d c4 (d8) e }
\repeat volta 2 {d4 d8 [e] f f}
\alternative {
{c d c4 (c8) c}
{c d c2 \bar"|."}
}
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


