\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas, Šūpuļdziesmas
% Šūpo mani māmulina vizulīšu šūpulī, Vestiena
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
c8^\markup{"runas ātrums"} f f f | f8 d d d |
\time 4/4
f4 d d2 |
\time 2/4
\phrasingSlurDashed
c8 f f\( f\) | f8 d d\( d\) |
\time 4/4
f4 d d2
\bar"|."
}




lyricA = \lyricmode {
Šū -- po ma -- ni, mā -- mu -- li -- ņa, mā -- mu -- liņ', vi -- zu -- lī -- šu šū -- pu -- lī, _ šū -- pu -- lī!
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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


