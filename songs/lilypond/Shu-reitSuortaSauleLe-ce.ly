\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.104
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 3/4
c8 a f4 f | d'8 d c4 a | f8 a c4 bes | c8 bes a2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Šū -- reit suor -- ta sau -- le lē -- ce, maņ mā -- me -- ņa mū -- dy -- nuoj.
}

voiceB = \relative c'' {
\clef "treble"
\key f \major
\time 3/4
c8 a f4 f | bes8 bes a4 f | f8 f a4 g | a8 g f2 \bar"|."
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


