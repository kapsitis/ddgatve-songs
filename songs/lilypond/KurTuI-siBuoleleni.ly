\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.108
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 3/4
a8 a a a g a | \time 2/4 bes4. a8 | \time 3/4 g g g g a bes | \time 2/4 a4. g8 |
\time 3/4 f f f f e f | \time 2/4 g4. f8 | \time 3/4 e e e e d e | \time 2/4 f2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Kur tu ī -- si, buo -- le -- le -- ni, bol -- tys kuo -- je -- nis a -- puo -- vis,
kur tu ī -- si, buo -- le -- le -- ni, bol -- tys kuo -- je -- nis a -- puov's.
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


