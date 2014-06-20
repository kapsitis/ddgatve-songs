\version "2.13.16"
%\header {
%    title = "Dieviņš brida rudzu lauku",AA lapas, Jāņi
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
\time 2/4
c8 d e g |
f8 e d c |
\time 4/4
e8[ f] g2. |
\time 2/4
g8 e f g |
e8 d c d |
e4 d |
b8[ c] c4\fermata |
\bar "|."
} 

lyricA = \lyricmode {
Die -- viņš bri -- da ru -- dzu lau -- ku, lī -- go, ar pe -- lē -- ku mē -- te -- lī -- ti, lī -- go, lī -- go! 
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


