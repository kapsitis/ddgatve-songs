\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Rakstā situ sprigulīti
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key d \major
\time 5/8
d8 d d[ cis] b |
cis8 cis cis[ b] a |
d8 d d[ e] fis |
fis8 e e4. |
g8 b b[ a] g |
fis8 fis fis[ e] d |
e8 e e[ fis] e |
d8 d d4. |
\bar "|."
}


voiceB = \relative c' {
\clef "treble"
\key d \major
\time 5/8
s4 s4. |
s4 s4. |
s4 s4. |
s4 s4. |
g'8 g g[ fis] e |
d8 d d[ cis] b |
a8 a a[ b] cis |
d8 d d4. |

\bar "|."
}


lyricA = \lyricmode {
Rak -- stā si -- tu spri -- gu -- lī -- ti sa -- va tē -- va pie -- dar -- bā,
rak -- stā si -- tu spri -- gu -- lī -- ti sa -- va tē -- va pie -- dar -- bā.
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


