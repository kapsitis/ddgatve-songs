\version "2.13.16"
%\header {
%    title = "Jānīts pūta vara tauri"
%}
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


voiceA = \transpose e a { \relative c' {
\clef "treble"
\key e \minor
\time 2/4
e8 e g g | fis8 e e e | e8 e g g | fis8 e e e | 
fis8 e e e | fis8 g fis4 | fis8 fis fis fis | g8 fis g fis |
g8 fis g fis | fis8 e e4 
\bar "|."
} }

lyricA = \lyricmode {
Jā -- nīts pū -- ta va -- ra tau -- ri 
vār -- tu sta -- ba ga -- li -- ņā -- i.
Jā -- nīts pū -- ta va -- ra taur' 
vār -- tu sta -- ba ga -- li -- ņā -- i;
vār -- tu sta -- ba ga -- li -- ņā.
}

voiceB = \transpose e a { \relative c' {
\clef "treble"
\key e \minor
\time 2/4
s2 | s2 | s2 | s2 |
d1~ d1~ | d4 e4~ | e2 |
} }

lyricB = \lyricmode {
Ē! __ Ē! __
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\lyricsto "voiceB" \new Lyrics \lyricB
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


