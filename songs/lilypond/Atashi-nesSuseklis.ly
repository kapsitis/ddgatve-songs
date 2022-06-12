\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.94
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 2/4
\repeat volta 2 {a8 g f e | d d d d | c c d e | f f f4 }
\repeat volta 2 {a8 a a4 | bes8 bes bes4 | c8 c c bes | a a a4}
}

lyricA = \lyricmode {
\set stanza = "1. "
Mo -- za be -- ju go -- nūs guo -- ju muo -- lu ne -- šu ku -- lei -- tē.
Ai -- ja -- jā, ral -- la -- lā, muo -- lu ne -- šu ku -- lei -- tē.
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


