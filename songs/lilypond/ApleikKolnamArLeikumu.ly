\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.52
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
  f8 f f f | f c c c | a'a a a | c c bes a |
  g g g g | c e, g g | g f e d | d c c4 | \break
  f4 f | f c8 c | a'4 a | c bes8 a |
  g4 g | c8 e, g4 | g8 f e d | d c c4 \bar"|."
}

lyricA = \lyricmode {
  \set stanza = "1. "
Ap -- leik kol -- nam ar lei -- ku -- mu, ap -- leik kol -- nam ar lei -- ku -- mu,
ap -- leik kol -- nam ar lei -- ku -- mu tau -- tu dā -- lu pa -- va -- dēj.
Trād -- rīd, trād -- ral -- lā, trād -- rīd, trād -- ral -- lā,
trād -- rīt ral -- lal -- lā, tau -- tu dā -- lu pa -- va -- dēj.
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 2/4
  f8 f f f | f c c c | f f f f | a a g f |
  e e e e | c' e, g g | g f e d | d c c4 |
  f4 f | f c8 c | f4 f  | a g8 f |
  e4 e | c'8 e, g4 | g8 f e d | d c c4 \bar"|."
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\lyricsto "voiceA" \new Lyrics  \lyricA
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


