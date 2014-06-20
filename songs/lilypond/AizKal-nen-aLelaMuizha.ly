\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.134
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 3/4
e8 e e4 g | e8 d e4 f | d8 e f4 a | g8 f e4 g |
c,8 e g4 c | b8 a g4 b | d,8 e f4 a | g8 f e2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Aiz kaļ -- ne -- ņa le -- la mui -- ža, sēr -- mi zyr -- gi, jau -- ni pui -- ši,
Aiz kaļ -- ne -- ņa le -- la mui -- ža, sēr -- mi zyr -- gi, jau -- ni puiš.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
%R\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


