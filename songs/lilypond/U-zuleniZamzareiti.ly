\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.18
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
c'8 c b b | a a g g | c a b g | a fis g g |
a g fis e | d d g g | a g fis e | d d g4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Ū -- zu -- le -- ni, zam -- za -- rei -- ti, ū -- zu -- le -- ni, zam -- za -- rei -- ti,
kū tu au -- gi le -- je -- ņā -- i, kū tu au -- gi le -- je -- ņā?
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


