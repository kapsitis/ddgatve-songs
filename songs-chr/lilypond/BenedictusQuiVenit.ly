\version "2.13.16" 
%\header {
%    title = "Benedictus qui venit"
%}
% Chants de Taizé, #15
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
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 6/8 \mark \markup { \circle \bold A } \tempo 4.=58
\repeat volta 2 {
e8.\( e16 fis8\) g4 g8 | fis4. fis4. \bar "||" \mark \markup { \circle \bold B }
g8.\( g16 a8\) b4 b8 | c4. b4  \breathe  b8 \bar "||" 
\once \override Staff.TimeSignature #'stencil = ##f
\time 6/8
\mark \markup { \circle \bold C }
b4  a8 g4 b8 | a4 g8 fis4. \bar "||" \mark \markup { \circle \bold D }
e8\( e fis\) g4. |  fis4 e8 b4. \bar "||"
} 
} 


lyricA = \lyricmode {
Be -- ne dic -- tus qui ve -- nit
Be -- ne dic -- tus qui ve -- nit,
in no -- mi -- ne, in no -- mi -- ne, in no -- mi -- ne Do -- mi -- ni. 
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


