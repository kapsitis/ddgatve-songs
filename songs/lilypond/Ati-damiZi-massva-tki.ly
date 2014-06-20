\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.37
\layout {
indent = #0
ragged-last = ##f
}


chordsA = \chordmode {
\time 2/4
f2:5 | bes4:5 f4:5 | c4:5 f4:5 | c4:5 f4:5 | 
f2:5 | bes4:5 f4:5 | c4:5 f4:5 | c4:5 f4:5 | 
}



voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
%MS
f8 g a a | bes bes a a | bes bes a4 | g8 g f4 |
%ME
f8 g a a | bes bes a a | bes g a4 | bes8 g f4 \bar"|."
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 2/4
f8 g f f | g g f f | g g f4 | c8 c f4 |
f8 g f e | g g f f | f e e4 | c8 c f4 |
}

lyricA = \lyricmode {
\set stanza = "1. "
A -- tī -- da -- mi Zī -- mas -- svēt -- ki, ka -- la -- dū, ka -- la -- dū!
Kū  jī lo -- ba at -- nas -- da -- mi, ka -- la -- dū, ka -- la -- dū!
}


fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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


