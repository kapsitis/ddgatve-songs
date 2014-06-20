\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.7
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
f8 f f f | f4 c8 c | d4 d8 d | d4 c | e e |
e d8 [e] | f4 f | f r | g8 g g a | bes4 g8 g |
a4 a8 a | a4 f | g g | g e | f f | f r \bar"|."
}

lyricA = \lyricmode {
Svei -- ci -- no -- jam, vē -- lē -- jam jums vy -- su lo -- bu, il -- gus go -- dus nū -- dzei -- vot!
Svei -- ci -- no -- jam, vē -- lē -- jam jums vy -- su lo -- bu; il -- gus go -- dus nū -- dzei -- vuot!
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


