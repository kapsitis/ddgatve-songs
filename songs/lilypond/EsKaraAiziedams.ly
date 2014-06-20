\version "2.13.16"
%\header {
%    title = "Es, karā aiziedams"
%}
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


voiceA = \relative c'' {
\clef "treble"
\key bes \major
\time 4/4
f,8. f16 f2 d4 |
bes'8. bes16 bes2 f4 
\time 3/4
d8 ees f4 g |
a4 bes a 
\time 2/4
a8 a a4 
\time 4/4
ees8. ees16 ees2 c4 |
a'8. a16 a2 g4
\time 3/4
f8 f d'4 c |
g4 a bes 
\time 2/4
bes8 bes bes4
\bar "|."
} 

lyricA = \lyricmode {
Es, ka -- rā -- i aiz -- ie -- da -- mis, Krus -- tu cir -- tu o -- zo -- lā, o -- zo -- lā.
Es, ka -- rā -- i aiz -- ie -- da -- mis, Krus -- tu cir -- tu o -- zo -- lā, o -- zo -- lā.
}

fullScore = <<
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
\markup { \with-color #(x11-color 'white) \sans \smaller "__" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}



