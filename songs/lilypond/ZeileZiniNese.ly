\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.118
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key d \major
\time 4/4
d4 fis a4. g8 | fis4 e d d | b' b b (a8) b |
a4 g8 [fis] a2 | fis8 g a a a b a g | fis g a g fis g a4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Muo -- seņ zei -- le zi -- ni ne -- se, īt tau -- to -- mi at -- sa -- ceit,
muo -- seņ zei -- le zi -- ni ne -- se, īt tau -- to -- mi at -- sa -- ceit.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
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


