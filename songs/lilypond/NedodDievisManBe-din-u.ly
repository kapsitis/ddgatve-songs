\version "2.13.16"
%\header {
%    title = "Nedod, Dievis, man bēdiņu"
%}
% FkLaiva; AALapas; 
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
\key g \major
\time 2/4
\repeat volta 2 {
\oneVoice
d8 d d8. g16 | g8 e e8. e16 | fis8 d d8. d16 | g8 g g4
}
b8 b b16[ a] g8 | e8 a a8. g16 | fis8 d d8. d16 | g8 g g4 |
\voiceOne
b8 d d16[ c] b8 | c8 e, a8. g16 | fis8 a16[ g] fis[ e] d8 | g8 g g4
\oneVoice
\bar "|."
}

lyricA = \lyricmode {
Ne -- dod, Die -- vis, man bē -- di -- ņu,
Es ne -- mā -- ku bē -- dā -- ties;
Vē -- ja mā -- tei vien pa -- sa -- ki, 
Lai ie -- pū -- ta ū -- de -- nī, 
Vē -- ja mā -- tei vien pa -- sa -- ki, 
Lai ie -- pū -- ta ū -- de -- nī.
}


voiceB = \relative c' {
\clef "treble"
\key g \major
\time 2/4
\repeat volta 2 {
\oneVoice
s2 | s2 | s2 | s2 |
}
s2 | s2 | s2 | s2 |
\voiceTwo
b'8 b b16[ a] g8 | e8 a a8. g16 | fis8 d d8. d16 | g8 g g4  
\oneVoice
\bar "|."
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


