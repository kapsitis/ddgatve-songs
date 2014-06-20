\version "2.13.16" 
%\header {
%    title = "Jubilate Deo"
%}
% Chants de Taizé, #2
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
\key c \major
\time 4/4 
c'2^\markup {  \circle \bold A } d | 
e4^\markup {  \circle \bold B } c c b | c4 a g4. f8 | e4( f) d2 | c2 g4 g | c2 r 
\bar "|." 
} 




lyricA = \lyricmode {
Ju -- bi -- la -- te De -- o, Ju -- bi -- la -- te De -- o, Al -- le -- lu -- ja. 
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


