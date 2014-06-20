\version "2.13.18"


\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}

\layout {
indent = #0
ragged-last = ##f
}

voiceA = \relative c''{
\clef "treble"
\key f \major
\time 4/4
\dynamicUp
a4\mf^\markup { \translate #'(-10 . 2) \italic Svinīgi }  bes c c | d d c (bes) | a2. r4 | a bes c c | d d c (bes) | a2. r4|
c c bes c8 [(bes]) | a4 bes bes a | c c bes c8 [(bes]) | a4 bes bes a \bar "|."
}

lyricA = \lyricmode {
E -- si go -- di -- nāts un sla -- vēts, Pes -- tī -- tājs Tu mū -- su dār -- gais, 
kas zem mai -- zes zī -- mēm pa -- slēpts, e -- si Dievs un Cil -- vēks īs -- tais.
}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
>>
}
>>


\score {
\fullScore
\header { piece = "__" opus = "__" }
}
\markup { \with-color #(x11-color 'white) \sans \smaller "aaa" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}