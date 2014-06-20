\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.79
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \minor
\time 5/4 c4 f as8 [g] f4. (g8) | \time 6/4 as4 as2 g4 f2 |
\time 5/4 c4 f as8 [g] bes4. g8 | \time 6/4 as4 as2 g4 f2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Ū -- guos guo -- ju, ū -- dze -- ņuo -- si
ar jau -- nuo -- kū -- i bruo -- le -- le -- ņu.
}

voiceB = \relative c'{
\clef "treble"
\key f \minor
\time 5/4 c4 f es f4. (g8) | \time 6/4 f4 f2 es4 f2 |
\time 5/4 c4 f f8 [es] g4. es8 | \time 6/4 f4 f2 es4 f2 \bar"|."
}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
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


