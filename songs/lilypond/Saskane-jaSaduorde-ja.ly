\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.83
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 6/8
\repeat volta 2 {
a'4 bes16 [a] g4 f8 | a4 bes16 [a] g4 f8 |
a a bes16 [a] g8 [a] bes | a4 g8 f4.
}
}

lyricA = \lyricmode {
\set stanza = "1. "
Sa -- ska -- nē -- ja, sa -- duor -- dē -- ja
dzeļ -- ža skry -- tu -- li po -- gol -- mā.
}

voiceB = \relative c'{
\clef "treble"
\key f \major
\time 6/8
\repeat volta 2 {
f4 g16 [f] e4 f8 | f4 g16 [f] e4 f8 |
f8 f g16 [f] e8 [f] g | f4 e8 f4.
}
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


