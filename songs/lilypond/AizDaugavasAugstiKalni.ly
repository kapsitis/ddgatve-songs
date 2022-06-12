\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Tumsā gāju, vakarā
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key a \minor
\time 2/4
c8 d c c |
d8 c c c |
d8 c c c |
d8 d e f |
f8 e d e |
f8 e d4 |
f8 f e f |
f8 e d e |
d8 d e f |
f8 e d4 |
\bar "|."
}


voiceB = \relative c' {
\clef "treble"
\key a \minor
\time 2/4
d8 c c c |
d8 c c c |
d8 c c c |
d8 d c d |
d8 c d d |
d8 c d4 |
d8 d d d |
c8 c d d |
d8 d c d |
c8 c d4 |
\bar "|."
}


lyricA = \lyricmode {
Aiz Dau -- ga -- vas aug -- sti kal -- ni, tur sar -- ka -- nas o -- gas au -- ga;
aiz Dau -- ga -- vas aug -- sti kaln', tur sar -- ka -- nas o -- gas au -- ga, tur sar -- ka -- nas o -- gas aug'.
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceB" \lyricA
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


