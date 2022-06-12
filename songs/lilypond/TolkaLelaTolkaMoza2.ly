\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.31
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 3/4
f4 f bes8 a | \time 2/4 bes g f f | g g bes bes | \time 4/4 a4 a g bes8 [a] |
a4 a bes4. g8 | bes4 a g bes8 [g] | a4 a bes4. g8 | bes4 a g2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Tol -- ka le -- la, tol -- ka mo -- za, tol -- ka sā -- tu pa -- pruo -- vē -- ja.
Tol -- ka le -- la, tol -- ka mo -- za, tol -- ka sā -- tu pa -- pruo -- vēj'.
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 3/4
f4 f g8 g | \time 2/4 g8 g f f | g g g g | \time 4/4 f4 f e g8 [e] |
f4 f g4. e8 | g4 f e g8 [e] | f4 f g4. e8 | g4 f g2
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


