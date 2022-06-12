\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.138
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key a \major
\time 2/4
a8 cis cis cis | d b cis b | a cis cis cis | d b cis b | a a e e |
a4 b | a (b8) gis | a a e e | a4 b | a2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Rei -- gas kun -- gi, nam -- nī -- ce -- ni, Rei -- gas kun -- gi, nam -- nī -- ce -- ni, sa -- jam nau -- du
žvuor -- dzy -- nū -- ti, sa -- jam nau -- du žvuor -- dzy -- nūt.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
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


