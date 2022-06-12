\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.47
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
a'8 c c c | d c c bes | a c c c | d c c a |
\repeat volta2 {d4 d | c (d8) c | bes4 c | a2 }
}

lyricA = \lyricmode {
  \set stanza = "1. "
Suoc, muo -- se -- ņa, tu pa prīk -- šu, tev vei -- cā -- si, tev va -- dā -- si,
tev vei -- cā -- si, tev va -- dās.
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 2/4
f8 a a a | bes a a g | f a a a | bes a a f
\repeat volta2 { bes 4 bes | a (bes8) a | g4 a | f2 }
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceA"  \lyricA
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


