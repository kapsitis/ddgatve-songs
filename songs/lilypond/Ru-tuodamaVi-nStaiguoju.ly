\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.40
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\repeat volta 2 { \time 2/4 f8 a g a | bes g a g | \time 3/4 f4 c'4. (bes8) | bes8 [c] a2 }
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\repeat volta 2 { \time 2/4 f8 f c f | g e f e | \time 3/4 f4 a4. (g8) | g8 [a] f2 }
}

lyricA = \lyricmode {
  \set stanza = "1. "
Rū -- tuo -- da -- ma vīn stai -- guo -- ju, rū -- tuoj, rū -- tuoj.
}

lyricB = \lyricmode {
Šū ga -- rū -- i va -- sa -- re -- ņu, rū -- tuoj, rū -- tuoj.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\lyricsto "voiceA" \new Lyrics  \lyricA
\lyricsto "voiceA" \new Lyrics  \lyricB

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


