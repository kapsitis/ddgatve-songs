\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.80
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\repeat volta 2 {\time 2/4 bes'8 bes a a | \time 3/4 bes a g a4. | \time 2/4 bes8 bes a a | \time 3/4 bes a g  f4. }
}

lyricA = \lyricmode {
\set stanza = "1. "
Ū -- zuls, ū -- zuls, bārz -- si, bārz -- si, kas sēd gal -- da ga -- le -- ņā -- i.
}

voiceB = \relative c'{
\clef "treble"
\key f \major
\repeat volta 2 {\time 2/4 g'8 g f f | \time 3/4 g f e f4. | \time 2/4 g8 g f f | \time 3/4 g8 f e f4. }
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


