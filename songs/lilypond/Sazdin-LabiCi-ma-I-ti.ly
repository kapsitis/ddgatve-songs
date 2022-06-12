\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.58
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 4/4
f8 g a a g e16 [f] g8 g \fermata | c a a16 [g] a8 g e16 [f] g8 g |
f16 [e] d8 d16 [e] f8 f e16 [d] e8 c | f16 [e] d8 d16 [e] f8 f e16 [d] e4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Saz -- diņ la -- bi cī -- mā ī -- ti, saz -- diņ la -- bi cī -- mā ī -- ti,
svāt -- diņ la -- bi cī -- muo -- tī -- si, svāt -- diņ la -- bi cī -- muo -- tīs.
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


