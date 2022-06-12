\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.23
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 5/4
c4 f bes4. (g8) a4 | g4 a2 g4 f |
bes8 [g] a4. g8 a4 bes | bes8 [a] g2 f \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Pa -- va -- sars -- i, pa -- va -- sars -- i, na maņ vī -- na -- mi pa -- va -- sars!
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 5/4
c4 f g4. (e8) f4 | e f2 e4 f |
g8 [e] f4. e8 f4 g | g8 [f] e2 f \bar"|."
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


