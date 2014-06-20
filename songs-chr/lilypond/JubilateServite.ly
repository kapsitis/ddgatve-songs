\version "2.13.16" 
%\header {
%    title = "Jubilate, servite"
%}
% Chants de Taizé, #7
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
\key d \major
\time 4/4 
d4\(^\markup {  \circle \bold A } fis b a \bar "||" fis4^\markup {  \circle \bold B } d2\) r4 |
d4\( fis b( a) | fis2\) r2  |
d'4\( a b2 | a4 fis g2 | fis4 d e e | d2\) r |
d'4 a b a | d4 a b a | fis4\( d e e | fis2\) r | 
d'4 a b a | d4 a b a | fis4\( d e e | 
d1\)
\bar "||" \mark \markup { D.C. }
} 


lyricA = \lyricmode {
Ju -- bi -- la -- te De -- o om -- nis ter -- ra. 
Ser -- vi -- te Do -- mi -- no in læ -- ti -- ti -- a.
Al -- le -- lu -- ia, al -- le -- lu -- ia, in læ -- ti -- ti -- a. 
Al -- le -- lu -- ia, al -- le -- lu -- ia, in læ -- ti -- ti -- a.  
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


