\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.113
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key g \major
\time 2/4
a8 a a a | g a b b | a a a a | g a b b |
c a a8. g16 | fis8 e16 [fis] g8 g | a a a8. g16 | fis8 e16 [fis] g4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Es na -- be -- ju dū -- muo -- ju -- se, kū Lai -- me -- ņa guo -- duo -- ju -- se?
Oi, Lai -- me -- ņa, muo -- mu -- le -- ņa, kū Lai -- me -- ņa guo -- duo -- jus'!
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
%\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


