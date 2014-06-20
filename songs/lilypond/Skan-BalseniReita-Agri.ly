\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.89
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
e'16 [d] c8 c e | d16 [e d] c d [b] d8 | c16 [b] c8 c e |
d16 [e d] c d8. b16 | d d d d d c b c |
d8 c16 [b] c8. b16 | d d d d d c b c | d8 c c4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Skaņ bal -- se -- ni rei -- tā ag -- ri, skaņ bal -- se -- ni rei -- tā ag -- ri,
vai -- ruok ska -- ni vo -- ko -- rā -- i, vo -- ko -- rā -- i, vai -- ruok ska -- ni vo -- ko -- rā -- i, vo -- ko -- rā.
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


