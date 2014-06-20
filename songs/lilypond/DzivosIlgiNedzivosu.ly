\version "2.13.16" 
%\header {
% title = "Dzīvoš' ilgi, nedzīvošu"
%}
% Austras dziesmu burtnīca, 11.lpp.
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
\key f \major
\time 4/4
\repeat volta 2 {
f4( e8) d c4. c8 | d4 d f f | f4 a, c( d8) c | c4. bes8 a2
}
}


lyricA = \lyricmode {
Dzī -- voš' il -- gi, ne -- dzī -- vo -- šu, Sau -- les mū -- žu ne -- dzī -- voš'.
}


chordsA = \chordmode {
d2:m a2:m | d1:m | f1:5 | c2:7 f2:5
}

fullScore = <<
\new ChordNames { \chordsA }
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


