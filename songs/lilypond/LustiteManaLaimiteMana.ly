\version "2.13.16"
%\header {
%    title = "Lustīte mana, Laimīte mana"
%}
%#(set-global-staff-size 18)
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
\key a \minor
\time 4/2
c8 a16 b c8 c g g16 f e8 e c' c e e d d e8. d16 |
c8 a16 b c8 c g g16 f e8 e a a a a e g a4
\bar "|."
} 

lyricA = \lyricmode {
Lus -- tī -- te ma -- na, Lai -- mī -- te ma -- na, 
tu vi -- su -- ri lī -- dzi nā -- ci,
Lus -- tī -- te ma -- na, Lai -- mī -- te ma -- na, 
tu vi -- su -- ri lī -- dzi nāc'.
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



