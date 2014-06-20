\version "2.13.16"
%\header {
%    title = "Labvakar tu, Mārtiņtēvs"
%}
% Dievsētas ļaudis. Gadskārtu dziesmas. 2007 (#28)
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
\time 4/4
\clef "treble"
\key f \major
a'8. f16 c'8 f, a g g4 | 
bes8. bes16 d8 bes bes a a4 | 
a8. f16 c'8 f, a g g4 | 
g8. a16 bes8 e, g f f4 
\bar "|."
} 

voiceB = \relative c' {
\time 4/4
\clef "treble"
\key f \major
f8. f16 f8 f f e e4 | 
g8. g16 f8 g g f f4 | 
f8. f16 f8 f f c c4 | 
c8. e16 g8 c, c f f4 
\bar "|."
} 

lyricA = \lyricmode {
Lab -- va -- kar tu, Mār -- tiņ -- tēvs, 
vai gai -- dī -- ji Mār -- tiņ -- bērns. 
Lab -- va -- kar tu, Mār -- tiņ -- tēvs, 
vai gai -- dī -- ji Mār -- tiņ -- bērns. 
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


