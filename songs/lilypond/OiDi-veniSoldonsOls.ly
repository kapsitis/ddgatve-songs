\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.99
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 5/8
\repeat volta 2 {g8 g g [a] g | f a a4 a8 | bes g bes4 g8}
\alternative {
{bes a a4 a8}
{bes a a4. \bar"|."}
}
}

lyricA = \lyricmode {
\set stanza = "1. "
Oi, Dī -- ve -- ni, sol -- dons ols -- i, pa -- ma -- tei -- gai vy -- sa be -- ja, vy -- sa bej'.
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 5/8
\repeat volta 2 {e8 e e [d] c | c f f4 f8 | g e g4 e8}
\alternative {
{g f f4 f8}
{g f f4. \bar"|."}
}
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


