\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.86
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 3/4
f8 g a4 a | bes8 bes a4. g8 | f g a4 a | bes8 bes a4. g8 |
f4 g f8 f | e c f4. e8 | f4 g f8 f | e c f2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Mo -- za, mo -- za tei mui -- že -- ņa, mo -- za, mo -- za tei mui -- že -- ņa
vys -- ap -- lei -- ki ī -- vys zīd -- i, vys -- ap -- lei -- ki ī -- vys zīd.
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


