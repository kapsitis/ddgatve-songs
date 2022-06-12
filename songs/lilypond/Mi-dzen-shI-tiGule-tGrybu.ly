\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.78
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
g'8 g b b | g g b b | d d c8. b16 | b8 a a4 |
d,8 fis a a | d, fis a a | e' e d8. c16 | c8 b b4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Mī -- dzeņš ī -- ti, gu -- lēt gry -- bu, na -- laiž ma -- ni muo -- mu -- leit.
Mī -- dzeņš ī -- ti, gu -- lēt gry -- bu, na -- laiž ma -- ni muo -- mu -- leit.
}

voiceB = \relative c'{
\clef "treble"
\key g \major
\time 2/4
g'8 g b b | g g b b | b b a8. g16 | g8 fis fis4 |
d8 fis a a | d, fis a a | c c b8. a16 | a8 g g4
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


