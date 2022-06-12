\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.77
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 4/4
f4. c8 f4 a | g4. a8 g4 g | a8 [g] f [e] d4 f |
c4. bes8 a4 c | c c c bes' | a2 g | f1 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Ska -- ņu bal -- se -- ņu pa -- lai -- du ska -- ņa me -- ža ma -- le -- ņā -- i, ska -- ņa me -- ža ma -- le -- ņā.
}

voiceB = \relative c'{
\clef "treble"
\key f \major
\time 4/4
f4. c8 f4 f | e4. f8 e4 e | f8 [e] d [c] d4 f |
c4. bes8 a4 c | c c c g'| f2 e | f1
}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
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


