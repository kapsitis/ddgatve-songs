\version "2.13.16" 
%\header {
%    title = "Dans nos obscurités"
%    composer = "J. Berthier"
%    arranger = "Communauté de Taizé"
%}
%% http://www.youtube.com/watch?v=Xzlgks035AM
%% http://www.nuitdesveilleurs.fr/pdf/pdf_fr/P4-ch/obscurites.pdf
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
\key e \minor
\time 4/4 \tempo 4=63
\partial 8*5
dis8 dis dis cis dis 
\repeat volta 2 {
e4. e8 e4 e8 fis | g8 fis e fis g4 a | b8 b b b c4 b | a4 r8 b8 b a g fis | 
e4. e8 e4 e8 fis | dis8 dis dis dis e4 fis | dis8 dis dis dis e4 fis  
}
\alternative {
{ dis4 r8 dis8 dis dis cis dis } { dis2 } 
}
} 

voiceB = \relative c' {
\clef "treble"
\key e \minor
\time 4/4 
\partial 8*5
b8 b b cis b 
\repeat volta 2 {
e4. e8 e4 e8 e | e8 e b b e4 fis | g8 g g g e4 g | fis4 r8 g8 g fis e d | 
c4. c8 c4 c8 a | b8 b b b e4 a, | b8 b b b e4 a,  
}
\alternative {
{ b4 r8 b8 b b cis b } { b2 } 
}
} 



lyricA = \lyricmode {
Dans nos ob -- scu -- ri -- tés,
Al -- lu -- me le feu qui ne s’é -- teint ja -- mais, qui ne s’é -- teint ja -- mais.
Dans nos ob -- scu -- ri -- tés,
Al -- lu -- me le feu qui ne s’é -- teint ja -- mais, qui ne s’é -- teint ja -- 
% repeat 1
mais. Dans nos ob -- scu -- ri --
% repeat 2 
mais
}

chordsA = \chordmode {
\partial 8*5
b2  b8 | e1:m | e2.:m d4 | g2 c4 g4 | d2 g4 e4:m | c2 a2:m |
b2 e4:m a4:m | b2 e4:m a4:m | b1 | b2
 
}

fullScore = <<
\new ChordNames { \chordsA }
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


