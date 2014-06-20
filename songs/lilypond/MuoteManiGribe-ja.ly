\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.60
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key d \major
\time 2/4
\repeat volta 2 {fis8 e fis g | a4 fis | a8 a a g | fis4 fis }
\repeat volta 2 {e8 e e e | fis fis fis fis | g g g a | fis fis fis4}
}

lyricA = \lyricmode {
\set stanza = "1. "
Muo -- te ma -- ni gri -- bēj pi to va -- cuo at -- dūt.
Es tū va -- cū, es tū va -- cū nu mo -- zūt -- nes na -- mī -- ļuoj.
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


