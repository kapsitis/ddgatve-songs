\version "2.13.16" 
%\header {
%    title = "Jubilate Coeli"
%}
% Chants de Taizé, #28
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
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\clef treble  
\key d \major 
\time 4/4 \mark \markup { \circle \bold A }
\tempo 2=66
fis4^\markup{(otro dzied pēc izvēles)}^\markup{Divkāršs kanons} d8[( e]) fis4 d | a'2 a \bar "||" \mark \markup { \circle \bold B } 
a4 fis a d | cis8[( b]) a4( a) r \bar "||" 
\once \override Staff.TimeSignature #'stencil = ##f
\time 4/4
\mark \markup { \circle \bold C }
d2 a | a4( b) cis2 \bar "||" \mark \markup { \circle \bold D }  
d4 a fis d | e1 \bar "|."
} 


lyricA = \lyricmode {
Ju -- bi -- la -- te coe -- li, Ju -- bi -- la -- te mun -- di, 
Chris -- tus Je -- sus Sur -- re -- xit ve -- re.
}


voiceB = \relative c' {
\clef treble 
\key d \major
\time 4/4 
\parenthesize d1 | a'4 a a a \bar "||" 
fis2 d4 r | a'4 a a a \bar "||"
fis8[( e]) d4( d) r | a'4( b) cis2 \bar "||" 
d2 a | a,4 a e' e \bar "|."
\bar "|."
}

lyricB = \lyricmode {
-re 
Ju -- bi -- la -- te coe -- li, Ju -- bi -- la -- te mun -- di, 
Je -- sus Chris -- tus Sur -- re -- xit ve-
}


fullScore = <<
\new ChoirStaff <<
\new Staff = "upper" {<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
>>}
\new Staff = "lower" {<<
\new Voice = "voiceB" { \oneVoice \autoBeamOff \voiceB }
\lyricsto "voiceB" \new Lyrics \lyricB
>>}
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


