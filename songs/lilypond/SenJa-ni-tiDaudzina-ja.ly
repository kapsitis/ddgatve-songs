\version "2.13.16"
%\header {
%    title = "Sen Jānīti daudzināja",AA lapas, Jāņi
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
\key g \major
\time 2/4
d8 b c e |
d8 b a b |
c4 a |
c8[ d] e4 |
d8 d d e |
d8 b a b |
\time 4/4 
c4 b2. |
\bar "|."
} 

lyricA = \lyricmode {
Sen Jā -- nī -- ti dau -- dzi -- nā -- ja, lī -- go, lī -- go, nu Jā -- nī -- ti ie -- rau -- dzī -- ju, lī -- go!
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


