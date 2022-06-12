\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.53
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 4/4
  a'4. g8 f4 a | g4. f8 e4 g | a8 [g] f [e] d4 f |
  c4. bes8 a4 c | f f g g | c2 bes4 (c) | a1 \bar"|."
}

lyricA = \lyricmode {
  \set stanza = "1. "
Dzī -- dit, mei -- tas, vo -- ko -- rā -- i, vo -- ko -- rā -- i
tuo -- ļi ska -- ņi, vo -- ko -- rā -- i tuo -- ļi skaņ.
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 4/4
  a'4. g8 f4 a | g4. f8 e4 g | a8 [g] f [e] d4 f |
  c4. bes8 a4 c | f f e e | a2 g4 (a) | f1 \bar"|."
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceA"  \lyricA
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


