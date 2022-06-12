\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Saule brida miglājosi"
%}
% Pierakstīta pēc atmiņas no kasetes
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


voiceA = \transpose d a { \relative c' {
\clef "treble"
\key d \minor
\time 4/4
\oneVoice
g'8 g g g g f f f | f4 g f g | g8 g g g g f f f | f4 g2.\fermata
\voiceOne
b8 b b b b a a a | a4 b a b | b8 b b b b a a a | a4 b2.\fermata
\bar "|."
} }

lyricA = \lyricmode {
Sau -- le bri -- da mig -- lā -- jo -- si, lī -- go, lī -- go! 
Jā -- ņu die -- nas va -- ka -- rā -- i, lī -- go!
Sau -- le bri -- da mig -- lā -- jo -- si, lī -- go, lī -- go! 
Jā -- ņu die -- nas va -- ka -- rā -- i, lī -- go!
}



voiceB = \transpose d a { \relative c' {
\clef "treble"
\time 4/4
s1 | s1 | s1 | s1
g'8 g g g g f f f | f4 g f g | g8 g g g g f f f | f4 g2.\fermata
\bar "|."
} }

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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


