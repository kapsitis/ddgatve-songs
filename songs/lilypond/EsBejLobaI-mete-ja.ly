\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.96
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 2/4
\oneVoice
c8 c a f | d' d c a | c c bes g | f f f a \break |
\voiceOne
\repeat volta 2 {c4 a8 f | d' d c a | c c bes g}
\alternative {
{f f f a}
{f f f4 \bar"|."}
}
}

lyricA = \lyricmode {
\set stanza = "1. "
Es bej lo -- ba ī -- me -- tē -- ja, tū ni vī -- nam na -- nū -- lī -- džu.
Oi, lil -- lā, lil -- lā lil -- lā, tū ni vī -- nam na -- nū -- lī -- džu, na -- nū -- līdž.
}

voiceB = \relative c'' {
\clef "treble"
\key f \major
\time 2/4
s2 s s s
\repeat volta 2 {a4 a8 f | bes bes a f | c' c bes g}
\alternative {
{f f f a}
{f f f4 \bar"|."}
}
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
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


