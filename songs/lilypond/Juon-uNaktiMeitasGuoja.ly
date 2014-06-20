\version "2.13.16"
%\header {
%    title = "Juoņu nakti meitas guoja"
%}
% Katrīna Riekstiņa, #48 (Grodi)
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
\key d \minor
\time 4/4
f8 d e f16[ e] d8 f16[ e] d8 f | 
e4 e8[ f\fermata] e4 d |
d8 e f e d f d d | 
e4 e8[ f] e4 d\fermata
\bar "|."
} 

voiceB = \relative c' {
\clef "treble"
\key d \minor
\time 4/4
s1 | c4 c8[ d] c4 d | 
s1 | c4 c8[ d] c4 d
\bar "|."
} 


lyricA = \lyricmode {
Juo -- ņu nak -- ti mei -- tas guo -- ja, 
rū -- to, rū -- to, 
Ra -- se -- ņā -- i moz -- guo -- tī -- si, 
rū -- to, rū -- to. 
}

chordsA = \chordmode {
\time 4/4
d1:m | c4:5 d4:m c4:5 d4:m |
d1:m | c4:5 d4:m c4:5 d4:m |
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
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



