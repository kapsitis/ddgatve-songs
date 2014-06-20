\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.126
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\repeat volta 2 {\time 3/4 d4. e8 f d | \time 2/4 c c c [bes] | a c c d | c c c4}
\repeat volta 2 {g'8 g g e | f4 a | g8 g g (e) | f4 f}
}

lyricA = \lyricmode {
\set stanza = "1. "
Pa -- laid, pa -- laid, va -- ciņ -- kais, pa ūļ -- nei -- cu pa -- gū -- ļuot.
Ni es te -- vi lais -- šu, ni es pats ī -- šu.
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


