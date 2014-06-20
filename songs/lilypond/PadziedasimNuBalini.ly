\version "2.13.16"
%\header {
% title = "Padziedāsim nu, bāliņi"
%}
% J.Vītola t.dz. ar klavieru pavadījumu
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.3\cm
between-system-space = 0.3\cm
}
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key a \minor
\time 2/4
a'8 a g e | a8 c b b | c8 c d b | a8 a e[ f] |
g8 a b4\fermata | e4 e | d8 e c b | a2
\bar "|."
}



lyricAA = \lyricmode {
Pa -- dzie -- dā -- sim nu bā -- li -- ņi, vi -- si vie -- nā pul -- ci -- ņā, 
pul -- ci -- ņā, vi -- si vie -- nā pul -- ci -- ņā. 
}

lyricAB = \lyricmode {
Brü -- der, die wir hier ver -- sam -- melt, laßt uns al -- le sin -- gen jetzt,
sin -- gen jetzt, laßt uns al -- le sin -- gen jetzt.
}


chordsA = \chordmode {
\time 2/4
a4:m e4:m | a4:m d4:m6 | a4:m e4:7 | a4:m c4:5 |
g4:5 g4:7 | c2:5 | b4:dim e4:5 | a2:m 
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricAA
\lyricsto "voiceA" \new Lyrics \lyricAB
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


