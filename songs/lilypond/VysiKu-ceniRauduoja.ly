\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.21
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
f8 c c c | f c c c | g' g g bes | a4 g |
f2 | bes4 bes | bes a8 [g] | a4 a |
a g8 [f] | g g g bes | a4 g | f2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Vy -- si kū -- ce -- ni rau -- duo -- ja ru -- di -- ņa -- mi a -- te -- jūt.
Vy -- si kū -- ce -- ni rau -- duo -- ja ru -- di -- ņa -- mi a -- te -- jūt.
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 2/4
f8 c c c | f c c c | e e e g | f4 e |
f2 | g4 g | g f8 [e] | f4 f |
f e8 [d] | c c c g' | f4 e | f2 \bar"|."
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


