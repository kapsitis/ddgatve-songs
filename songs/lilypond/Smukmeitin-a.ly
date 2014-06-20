\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.55
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
f8 f f f | f g a f | g g g g | g a bes g |
\time 4/4 a4 a g g | g g c4. a8 | bes [a] g4 a a | g g f2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Smuk -- mei -- ti -- ņa sī -- nu ko -- sa tei -- ru -- me -- ņa ga -- le -- ņā -- i,
smuk -- mei -- ti -- ņa sī -- nu ko -- sa tei -- ru -- me -- ņa ga -- le -- ņā.
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


