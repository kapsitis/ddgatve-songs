\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.142
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 11/8
r8 f4 a8 a a g f g g4 | c8 a4 a8 a4 g8 f g g4 |
g8 d f f4 f8 e d e c16 [g'] r8 | g8 d f f4 f8 e d e c r \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Zvī -- dzi, zvī -- dzi sēr -- mais zir -- dzeņ, zvī -- dzi, zvī -- dzi sēr -- mais zir -- dzeņ,
vi -- de -- nī staļ -- ļa stuo -- vā -- dams' -- i, vi -- de -- nī staļ -- ļa stuo -- vā -- dams' -- i.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
%R\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


