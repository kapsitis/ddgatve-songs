\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.81
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4 
g'8 g g g | a4 g | a bes8 [g] | a a g a |
bes [g] a4 | g f | g8 g g g | a4 g | f2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Līc, mā -- me -- ņa, vai -- ņu -- ce -- ņu, līc, mā -- me -- ņa,
vai -- ņu -- ce -- ņu, vīg -- la -- jo -- mi rū -- cee -- ņom.
}

voiceB = \relative c'{
\clef "treble"
\key f \major
\time 2/4 
e8 e e c | f4 e | f g8 [e] | f f e f |
g [e] f4 | e f | e8 e e c | f4 e | f2 
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


