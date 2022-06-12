\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.33
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \minor
\time 4/4
es4 as8 [g] f4 es | f2 as | g f4 (as) |
\time 3/4 g4 as2 | g4 f2 | \time 4/4 f4 (g) as2 | g2 as |
f4 g as as | g f (as2) | g f \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Kur, Ju -- mei -- ti, tu gu -- lē -- ji,
kur, Ju -- mei -- ti, tu gu -- lē -- ji
tai -- du ga -- ru va -- sa -- re -- ņu?
}

voiceB = \relative c' {
\clef "treble"
\key f \minor
\time 4/4
es4 as8 [g] f4 es | f2 f | es2 f4 (f) |
\time 3/4 es4 f2 | es4 f2 | \time 4/4 des4 (es) f2 | es2 f |
des4 es f f | es f (f2) | es f \bar"|."
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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


