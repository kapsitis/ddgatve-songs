\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.136
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 4/4
c8 f f f f g a f | e g g g g g g a | bes [a] c4 a a |
g g c4. a8 | bes8 [a] g4 a8 [g] f4 | g4 g f2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
A -- tīt po -- ša bol -- ta vīš -- ņa par a -- za -- ru lei -- go -- da -- ma.
A -- tīt po -- ša bol -- ta vīš -- ņa par a -- za -- ru lei -- go -- dam.
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


