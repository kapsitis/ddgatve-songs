\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Kaut zinātu to kalniņu
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key d \minor
\time 3/4
d4 f e8 d |
\time 4/4
c8[ d] e4 d4. a8 |
\time 3/4
d8[ e] f4 e8 d |
\time 4/4
c4 e d2 |
\time 3/4
d4 a' f8 f |
\time 4/4
g4 g a4. f8 |
\time 3/4
e4 d c8 d |
\time 4/4
e4 f8[ e] d2 |
\bar "|."
} 


voiceB = \relative c' {
\clef "treble"
\key d \minor
\time 3/4
s2 s4 |
\time 4/4
s2 s2 |
\time 3/4
s2 s4 |
\time 4/4
s2 s2 |
\time 3/4
d4 d d8 d |
\time 4/4
c4 c f4. f8 |
\time 3/4
s2 s4 |
\time 4/4
s2 s2 |
\bar "|."
} 

lyricA = \lyricmode {
Kaut zi -- nā -- tu to kal -- ni -- ņu, kur guļ ma -- na mā -- mu -- līt, 
kaut zi -- nā -- tu to kal -- ni -- ņu, kur guļ ma -- na mā -- mu -- līt'.
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


