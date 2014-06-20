\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.102
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 3/4 bes8 g bes4 f | \time 4/4 c' bes8 [c] a4. a8 | \time 3/4 bes g bes4 f |
\time 4/4 c' bes8 [c] a4. a8 | \time 3/4 bes g bes4 f | \time 4/4 c' bes8 [c] a2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Ru -- dens ī -- ti, ru -- dens ī -- ti dzal -- to -- no -- mi
la -- pe -- ņo -- mi, dzal -- to -- no -- mi la -- pe -- ņom.
}

voiceB = \relative c'' {
\clef "treble"
\key f \major
\time 3/4 bes8 g bes4 f | \time 4/4 a g f4. f8 | \time 3/4 bes g bes4 f |
\time 4/4 a g f4. f8 | \time 3/4 bes g bes4 f | \time 4/4 a g f2 \bar"|."
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


