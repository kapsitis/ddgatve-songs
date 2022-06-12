\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Saule deva sav' meitiņu"
%}
% F/g "Laiva", rokraksts (Perkons.pdf)
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
\time 2/4
\clef "treble"
\key c \major
c8 c c e |
\time 3/4
f8 e d4. e8 |
\time 2/4
d8 d d d |
\time 3/4
d8 c e2 |
\time 2/4
c8 c c e |
\time 3/4
f8 e d4. e8 |
\time 2/4
d8 d d d |
\time 3/4
d8 c e2 |
} 


lyricA = \lyricmode {
Sau -- le de -- va sav' mei -- ti -- ņu 
Pār de -- vi -- ņi e -- ze -- riņ',
Sau -- le de -- va sav' mei -- ti -- ņu 
Pār de -- vi -- ņi e -- ze -- riņ'.
}

voiceB = \relative c' {
\time 2/4
\clef "treble"
\key c \major
c8 c c e |
\time 3/4
f8 e d4. e8 |
\time 2/4
d8 d d d |
\time 3/4
d8 c e2 |

\time 2/4
e8 e e g |
\time 3/4
a8 g f4. e8 |
\time 2/4
f8 f f f | 
\time 3/4
f8 e g2
}  

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceTwo \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Voice = "voiceB" { \voiceOne \autoBeamOff \voiceB }
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


