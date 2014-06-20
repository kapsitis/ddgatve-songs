\version "2.13.16" 
%\header {
%    title = "Dans nos obscurités"
%    composer = "Jacques Berthier"
%    arranger = "Communauté de Taizé"
%}
%% http://www.youtube.com/watch?v=Xzlgks035AM
%% http://www.nuitdesveilleurs.fr/pdf/pdf_fr/P4-ch/obscurites.pdf
#(set-global-staff-size 16)
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
b8 b b b b 
\repeat volta 2 {
b4. b8 b4 b8 b | e8 e e e e4 fis | g8 g g g g4 g | fis4 r8 g8 g fis e d | 
c4. c8 c4 c8 c | b8 b b b b4 c | b8 b b b b4 c  
}
\alternative {
{ b4 r8 b8 b b b b } { b2 } 
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


voiceC = \relative c' {
\clef bass
\key e \minor
\time 4/4 
\partial 8*5
fis,8 fis fis e fis 
\repeat volta 2 {
g4. g8 g4 g8 a | b8 a g a b4 d | d8 d d d e4 d | d4 r8 d8 d d b a | 
g4. g8 g4 g8 a | fis8 fis fis fis g4 a | fis8 fis fis fis g4 a  
}
\alternative {
{ fis4 r8 fis8 fis fis e fis } { fis2 } 
}
} 

voiceD = \relative c' {
\clef bass
\key e \minor
\time 4/4 
\partial 8*5
b,8 b b b b 
\repeat volta 2 {
e4. e8 e4 e8 e | e8 e e e e4 d | g8 g g g c4 g | d4 r8 g8 g d e b | 
c4. c8 c4 c8 a | b8 b b b e4 a, | b8 b b b e4 a,
}
\alternative {
{ b4 r8 b8 b b b b } { b2 } 
}
} 



fullScore = <<
\new StaffGroup <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\lyricsto "voiceA" \new Lyrics \lyricA
>>
}
\new Staff {
<<
\new Voice = "voiceC" { \voiceOne \autoBeamOff \voiceC }
\new Voice = "voiceD" { \voiceTwo \autoBeamOff \voiceD }
>>
}
>>
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


