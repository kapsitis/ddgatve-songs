\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.85
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\repeat volta 2 {e8 e f f | g g a g | f f g f | e e e4}
\repeat volta 2 {g8 g g g | \time3/4 a b c4 (b8) a | \time2/4 a a a a | a g g4}
}

lyricA = \lyricmode {
\set stanza = "1. "
Mal -- ni mu -- ni ku -- me -- le -- ni kai iu -- di -- ņa vo -- gu -- leņ.
Mal -- ni mu -- ni ku -- me -- le -- ni kai iu -- di -- ņa vo -- gu -- leņ.
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


