\version "2.13.16" 
%\header {
%    title = "Jubilate et Cantate"
%}
% Chants de Taizé, #11
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
\key g \major
\time 4/4 
\repeat volta 2 {
g'2^\markup { \circle \bold A } g | fis g \bar "||"
g4^\markup { \circle \bold B } a b c8[( b]) | a4 d b a \bar "||"
g2^\markup { \circle \bold C } d | d g \bar "||"
b4^\markup { \circle \bold D } c d c8 d | d4 a r2 \bar "||"  
d4.^\markup { \circle \bold E } c8 b4 a8 g | a4 a g2
} 
} 


lyricA = \lyricmode {
Ju -- bi -- la -- te, et can -- ta -- te Chri -- sto Je -- su, al -- le -- lu -- ia!
re -- sur -- rex -- it et vi -- vit! Al -- le -- lu -- ia, al -- le -- lu -- ia!  
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


