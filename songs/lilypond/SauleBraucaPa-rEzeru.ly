\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% Budēļu grāmata, 25lpp.
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key a \minor
\time 4/2
 c'8 c b8. b16 c8 c b8. b16 c8 c d8. c16 d8 b a4 | 
\time 4/4
a8 g a a g g a4 | \bar"|."
}

lyricA = \lyricmode {

Sau -- le brau -- ca pār e -- ze -- ru
Spī -- de -- da -- ma, vi -- zē -- dam',
Spī -- de -- da -- ma, vi -- zē -- dam'.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
%\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


