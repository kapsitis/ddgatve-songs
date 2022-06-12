\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.82
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4 
c8 f a bes | a4 bes8 a | a g f4 | bes8 g4 a8 | a [g] f4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Za -- ļā duor -- ze -- ņā, duor -- za ma -- le -- ņā kiu -- koj dza -- giu -- ze.
}

voiceB = \relative c'{
\clef "treble"
\key f \major
\time 2/4
c8 f f g | f4 g8 f | f e f4 | g8 e4 f8 | f [e] f4
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


