\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Rāmi, rāmi es dziedāju
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4
g'4 f8[ e] g4 f8[ e] |
g4 e f e8[ f] |
g4 g g f |
g4 e d c |
g'2 g |
e2 d |
e4 g g f |
e1 |
\bar "|."
}


voiceB = \relative c' {
\clef "treble"
\key c \major
\time 4/4
s1 |
c4 c d8[ c] c4 |
c4 c d8[ c] c4 |
c4 c d8[ c] c4 |
c2 d |
c2 g |
c4 c b c |
c1 |
\bar "|."
}


lyricA = \lyricmode {
Rā -- mi, rā -- mi es dzie -- dā -- ju, vēl jo rā -- mi ga -- vi -- lē -- ju,
ai -- rai rai -- rā, ai -- rai -- rai -- rai -- rā!
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


