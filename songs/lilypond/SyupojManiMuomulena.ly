\version "2.13.16"
%\header {
%    title = "Šyupoj mani, muomuleņa"
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


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 5/4
c4 g'8.[ f16] e8 e f d c g | c4 g'8.[ f16] e8 e f d c4 
\repeat volta 2 {
\time 4/4
f8 a a a e g g g |  b8 a g f e c c4 
}
} 

lyricA = \lyricmode {
Šyu -- poj ma -- ni, muo -- mu -- le -- ņa, 
Šyu -- poj ma -- ni, muo -- mu -- leņ, 
vuo -- lyu -- dzei -- tis vuo -- lyu -- dzei -- tis vuo -- lyu -- dzei -- tis šyu -- pu -- lī.
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










