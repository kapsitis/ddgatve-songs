\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.127
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 3/4 
c4 e e8 e | d4 f f8 f | e4 g g8 g | \time 4/4 a4 g g2 |
\time 3/4 a4 f f8 f | g4 e e8 e | d4 g g8 f | \time 4/4 e4 d c2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Cyl -- pu, cyl -- pu za -- čeits lē -- ce nu o -- po -- ra o -- po -- rā.
Cyl -- pu, cyl -- pu za -- čeits lē -- ce nu o -- po -- ra o -- po -- rā.
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


