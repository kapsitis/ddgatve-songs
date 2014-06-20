\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.106
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 6/8
f4 f8 f [e] f | g4 e8 c4 c8 | g'4 g8 g [f] e | f4 f8 f4. |
\repeat volta 2 {d'4 d8 d [c] bes | c4 c8 c [bes] a | bes4 bes8 bes [a] g | a4 a8 a4.}
}

lyricA = \lyricmode {
\set stanza = "1. "
Aiz a -- za -- ra mal -- ni me -- ži, bol -- ti zī -- de -- ni zī -- dēj'.
Puor -- ceļ ma -- ni buo -- le -- le -- ni, lai es ve -- ju vai -- na -- dzeņ'.
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 6/8
f4 f8 f [e] f | g4 e8 c4 c8 | e4 e8 e [d] e | f4 f8 f4. |
\repeat volta 2 {bes4 bes 8 bes [a] g | a4 a8 a [g] f | g4 g8 g [f] e | f4 f8 f4.}
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
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


