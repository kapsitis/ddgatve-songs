\version "2.13.16" 
%\header {
%    title = "Cantate Domino"
%}
% Chants de Taizé, #8
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
\key c \minor
\time 4/4 
c4(^\markup {  \circle \bold A } b4) c4 c | ees4. f8 d2  \bar "||" 
r8^\markup { \circle \bold B } ees8 ees d ees4 g8 g | c4.( d8) b2 \bar "||"
c4^\markup { \circle \bold C } g4 ees4. ees8  | aes2 g \bar "||"
} 


lyricA = \lyricmode {
Can -- ta -- te Do -- mi -- no. 
Al -- le -- lu -- ia, al -- le -- lu -- ia!
Ju -- bi -- la -- te De -- o.  
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


