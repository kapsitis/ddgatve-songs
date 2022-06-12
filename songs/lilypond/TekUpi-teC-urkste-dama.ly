\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Tek upīte čurkstēdama",AA lapas, bēres
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

voiceA = \relative c' {
\clef "treble"
\key a \minor
\time 2/4
e8 e d d |
c8 c c d |
e8 e d d |
c8 c c d |
e8 c e d |
c8 d d4 |
e8 d c d |
e8 d d4 |
e8 c d b |
c8 c c4\fermata |
\bar "|."
} 

lyricA = \lyricmode {
Tek u -- pī -- te čurk -- stē -- da -- ma, bur -- bu -- lī -- šus mē -- tā -- da -- ma;
tek u -- pī -- te čurk -- stē -- dam', bur -- bu -- lī -- šus mē -- tā -- dam',
bur -- bu -- lī -- šus mē -- tā -- dam'.
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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


