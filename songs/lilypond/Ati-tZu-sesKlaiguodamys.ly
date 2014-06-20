\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.26
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 5/4
c4 f2 g4 f | \time 4/4 g4 bes8 [a] g4 g | bes8 [a] g4 f a |
g a f f | a a g a | g g f f |
f f g g | g bes8 [a] g4 f | g4 g f a | g g f2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
A -- tīt zū -- ses klai -- guo -- da -- mys nu dyu -- ņai -- nuo e -- ze -- re -- ņa,
a -- tīt zū -- ses klai -- guo -- da -- mys nu dyu -- ņai -- nuo e -- ze -- re -- ņa, nu dyu -- ņai -- nuo e -- ze -- reņ.
}

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 5/4
c4 f2 g4 f | \time 4/4 g4 bes8 [a] g4 g | bes8 [a] g4 f a |
g a f f | f f e f | e e f f |
f d e e | e g8 [f] e4 d | c c f f | e e f2
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


