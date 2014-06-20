\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.43
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
g'8 g f f | e g c c |
\repeat volta 2 { \time 3/4 e4 e2 | d4 c2 |
\time 2/4 b8 d c a | g g f a | \time 3/4 g4 e2 }
}

lyricA = \lyricmode {
  \set stanza = "1. "
Juo -- ņa dī -- nys gai -- dei -- da -- ma, lei -- gū, lei -- gū,
sī -- ru sē -- ju ri -- tu -- lī -- i, lei -- gū.
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
g'8 g f f | e g c c |
\repeat volta 2 { \time 3/4 c4 c2 | g4 a2 |
\time 2/4 g8 b a a | g g f a | \time 3/4 g4 e2 }
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\lyricsto "voiceA" \new Lyrics  \lyricA
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


