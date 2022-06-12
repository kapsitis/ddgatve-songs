\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.61
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
\repeat volta 2 {f8 c c c | d c c c }
g' g g g | g4 e | f2 | f4 bes | bes (a8) g | f4 a |
a (g8) f | e c c c | g'4 e | f2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Treis vo -- ko -- ri vī -- tu tai -- su va -- ca -- ja -- mi bryu -- go -- nom.
Treis vo -- ko -- ri vī -- tu tai -- su va -- ca -- ja -- mi bryu -- go -- nom.
}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
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


