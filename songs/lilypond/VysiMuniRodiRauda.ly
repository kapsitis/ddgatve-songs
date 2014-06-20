\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.129
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 3/4 
f8 f a4. a8 | g e f4. f8 | f a c4. c8 | c bes a2 |
f8 f d'4. d8 | d c c4. a8 | c bes bes4. g8 | c bes a2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Vy -- si mu -- ni ro -- di rau -- da, ka es kol -- pa lei -- ga -- veņ,
vy -- si mu -- ni ro -- di rau -- da, ka es kol -- pa lei -- ga -- veņ.
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


