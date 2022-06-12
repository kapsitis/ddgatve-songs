\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.17
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
e4. f8 | g f e f | g4 e | e4. f8 |
g f e f | g4 e | g g | \time 3/4 a8 g f8. e16 f8 f |
\time 2/4 f4 f | \time 3/4 g8 f e8. d16 e4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Vy -- su me -- žu iz -- stai -- guo -- ju, vy -- su me -- žu iz -- stai -- guo -- ju
tai -- da kū -- ka na -- da -- buo -- ju, tai -- da kū -- ka na -- da -- buoj!
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


