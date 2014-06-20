\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.121
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 2/4
a8 c c c | d c c bes | a c c c | d c c bes |
\time 4/4 a4 bes c4. bes8 | a4 bes c2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Pū -- ri, pū -- ri, me -- ži, me -- ži, kur muo -- se -- ņu iz -- de -- vā -- mi,
iz -- de -- vā -- mi, iz -- de -- vām.
}

voiceB= \relative c' {
\clef "treble"
\key f \major
\time 2/4
f8 a a a | bes a a g | f a a a | bes a a g |
\time 4/4 f4 g a4. g8 | f4 g a2 \bar"|."
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


