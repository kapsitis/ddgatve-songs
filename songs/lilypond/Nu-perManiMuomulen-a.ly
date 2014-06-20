\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.48
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
\oneVoice
f4 c'8. [bes16] | \time 3/4 a8 a g g f c | \time 2/4 f4 c'8. [bes16] | \time 3/4 a8 a g g f4 |
\voiceOne
\time 2/4
\repeat volta 2 { d'8 d d d | c c c c | bes bes c8. bes16 | a8 a a4 }
}

lyricA = \lyricmode {
  \set stanza = "1. "
Nū -- per ma -- ni, muo -- mu -- le -- ņa, nū -- per ma -- ni, muo -- mu -- leņ,
ar vei -- tu -- la. ar vei -- tū -- la, ar vei -- tū -- la ža -- ga -- reņ'.
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 2/4
s2 |\time 3/4 s2. | \time 2/4 s2 |\time 3/4 s2. |
\time 2/4
\repeat volta2 { bes'8 bes bes bes | a a a a | g g a8. g16 | f8 f f4 }
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


