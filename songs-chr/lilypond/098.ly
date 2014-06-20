\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}

\layout {
indent = #0
ragged-last = ##f
}

chordsA = \chordmode {
s4 es2 bes as es  es f:7 bes1 es2 bes as es f:min bes es1. as2 bes es f:min bes es1
}

voiceA = \relative c' {
\clef "treble"
\key es \major
\time 4/4
%\dynamicUp
\partial 4

es4 | g g f es | as2 g4 g | bes g es f | f2. g4 | bes g as bes | c2 bes4 c | as g f as | g2. bes4 |
es es d es | bes2 bes4 c | as g f f | es1 \bar"|."
}

lyricA = \lyricmode {
Nāc, Jē -- zu, ma -- nā sir -- dī un e -- si žē -- līgs man. Tu ma -- nas do -- mas dzir -- di, Tev ma -- na dvēs' -- le skan.
Tu ma -- nas do -- mas dzir -- di, Tev ma -- na dvēs' -- le skan.
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
>>
}
>>


\score {
\fullScore
\header { piece = "__" opus = "__" }
}
\markup { \with-color #(x11-color 'white) \sans \smaller "aaa" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}


