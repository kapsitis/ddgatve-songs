\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Kur tu jāsi, smuks puisīti"
%}
% Austras dziesmu burtnīca, 17.lpp.
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
\key c \major
\time 3/4
c4 e e8 c | d4 f f8 d | e4 g g8 g \time 4/4
a4 g4 g4. e8
\time 3/4
f4 a a8 f | e4 g g8 e | d4 g b8 a \time 4/4
g4 f e2 
\bar "|." 
}


lyricA = \lyricmode {
Kur tu jā -- si smuks pui -- sī -- ti, mig -- lai -- nā -- i va -- ka -- rā -- i, 
Kur tu jā -- si smuks pui -- sī -- ti, mig -- lai -- nā -- i va -- ka -- rā?
}


chordsA = \chordmode {
\time 3/4
c2.:5 | d2.:m | e2.:m \time 4/4
a1:7
\time 3/4
f2.:5 | c2.:/e | g2.:/d \time 4/4
g2:7 c2:5
}

fullScore = <<
\new ChordNames { \chordsA }
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


