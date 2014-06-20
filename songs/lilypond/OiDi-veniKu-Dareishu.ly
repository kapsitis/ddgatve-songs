\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.116
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
f8 f e f16 [e] | d8 d f16 [e] d8 | e e f e | d d d4 |
\repeat volta 2 {g8 g g16 [a] bes8 | a a a16 [g] f8 | e e f e | d d d4}
}

lyricA = \lyricmode {
\set stanza = "1. "
Oi, Dī -- ve -- ni, kū da -- rei -- šu, so -- ka ma -- ni dzā -- ruoj' sīv.
Jim -- šu so -- vu vai -- ņu -- ce -- ņu, kuor -- šu nīd -- res ga -- le -- ņā.
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


