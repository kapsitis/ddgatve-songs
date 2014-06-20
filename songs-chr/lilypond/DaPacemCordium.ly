\version "2.13.16" 
%\header {
%    title = "Da pacem cordium"
%}
% Chants de Taizé, #35
\paper {
line-width = 10\cm
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
\time 4/4 \tempo 2=72
\partial 4*1
c4 
\repeat volta 2 {
c4^\markup{\circle \bold A} c c c | c2 r4 c |
c4 c c c | c1 \bar "||"
g'2.(^\markup{\circle \bold B} e4 | f2. c4 | e1) | c1 \bar "||"
c'2.(^\markup{\circle \bold C} bes4 | a!2 g4 f | g1) | f2 r4 c  
} 
} 


lyricA = \lyricmode {
Da pa -- cem cor -- di -- um. 
Da pa -- cem cor -- di -- um. 
Pa -- cem. Pa -- cem. 
Da
}

voiceB = \relative c' {
\clef "treble"
\key d \minor
\time 4/4 
\partial 4*1
s4
\repeat volta 2 {
s1 | s1 | s1 | s2. c4 |
c4 c s2 | s1 | s1 | s2. c4 |
c4 c s2 | s1 | s1 | s1
} 
}

lyricB = \lyricmode {
Da pa -- cem  
Da pa -- cem  
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
%\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\lyricsto "voiceA" \new Lyrics \lyricA
%\lyricsto "voiceB" \new Lyrics \lyricB
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


