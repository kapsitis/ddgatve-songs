\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.84
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
d'8 d d d | c b a a | c c c b | d d b4 |
d8 d d d  | c b a4 | c8 c c b | d d b4 \bar"|."
\repeat volta 2 {
e,4 fis | g8 fis e fis | g4 e
}
g4 g | \time 3/4 a8 g fis e d e | \time 2/4 fis4 fis | \time 3/4 g8 fis e d e4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "Ref. "
Kup -- la lī -- pe -- ņjā iz -- au -- ga mu -- nā gū -- vu duor -- ze -- ņā.
Ai -- ļa, li -- ļa, li -- ļa -- ļā, mu -- nā gū -- vu duor -- ze -- ņā.
\set stanza = "1. "
Kup -- la lī -- pe -- ņa iz -- au -- ga mu -- nā gū -- vu duor -- ze -- ņā -- i, mu -- nā gū -- vu duor -- ze -- ņā.
}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
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


