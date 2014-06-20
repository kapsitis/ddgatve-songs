\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.50
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
  \repeat volta 2 { g'4 g8 e | f g e4 }
  \repeat volta 2 { a8 a a4 | g8 g g4 | f8 f g f | e2 }
}

lyricA = \lyricmode {
  \set stanza = "1. "
Jau ru -- diņs ty -- vo -- jās,
rū -- žu lauks, rū -- žu lauks stei -- dzās nū -- zī -- dēt.
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
  \repeat volta 2 { e4 e8 c | d e c4 }
  \repeat volta 2 { f8 f f4 | e8 e e4 | d8 d e d | c2 }
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


