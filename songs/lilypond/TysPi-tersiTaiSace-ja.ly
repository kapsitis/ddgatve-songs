\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.56
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key d \major
\time 2/4
a'8 fis g a | fis fis fis fis | a fis g a | fis fis fis e |
d d e e | fis2 | g4 b | a8 a g g | fis2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Tys Pī -- ters -- i tai sa -- cē -- ja: nuoc, A -- nei -- te, tu pi maņ's,
ai ļu -- vai, ļu -- vai, ļu, nuoc, A -- nei -- te tu pi maņ's.
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


