\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.119
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key c \major
\time 2/4
\phrasingSlurDashed
g8 \(g\) g g | g4 c,8 c | a'8 a a a | g4 (a8) g |
f \(f\) f a | g4 e8 e | d e f d | c4 c \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Pa -- ī -- sim mēs, muo -- se -- nis, pa u -- pis ma -- le -- ņu,
pa -- ī -- sim mēs, muo -- se -- nis, pa u -- pis ma -- le -- ņu.
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


