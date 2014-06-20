\version "2.13.16" 
%\header {
%    title = "Gloria ... et in terra pax"
%}
% Chants de Taizé, #4
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
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 4/4 \mark \markup {  \circle \bold A }
g'8^"rythmé"^> g g r g^> g g r | aes8 aes g f g4 g |
\bar "||" \mark \markup { \circle \bold B }
c8^> c g r ees^> ees c r | r8 f ees f g4 r 
\bar "||" \mark \markup { \circle \bold C }
c,8^"piano"\( c d d ees r ees4 | f8( ees) f4 d2\) 
\bar "||" \mark \markup { \circle \bold D }
ees4\( g c c | d8[ c b c] d2\)
\bar "||" 
} 




lyricA = \lyricmode {
Glo -- ri -- a, Glo -- ri -- a, in ex -- cel -- sis De -- o, 
Glo -- ri -- a, Glo -- ri -- a, al -- le -- lu -- ia!
Et in ter -- ra pax ho -- mi -- ni -- bus bo -- næ vo -- lun -- ta -- tis. 
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


