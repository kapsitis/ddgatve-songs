\version "2.13.16" 
%\header {
% title = "Dziedu, dziedu, ko es dziedu"
%}
% Austras dziesmu burtnīca, 9.lpp.
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
\repeat volta 2 {
\time 2/4
g'8 g f f | e8 e d16[ c] d8 
}
\repeat volta 2 {
\time 4/4
a4 d e4. a,8 \time 3/4 f'8 e d4 a  
}
\repeat volta 2 {
\time 2/4
g'8 g f f | e8 e d16[ c] d8 
}
\repeat volta 2 {
\time 4/4
a4 d e4. a,8 \time 3/4 f'8 e d2
}
}


lyricA = \lyricmode {
Dzie -- du, dzie -- du, ko es dzie -- du, tik rau -- dā -- ti ne -- rau -- dā -- ju. 
De -- jum, de -- jum, je -- kum, je -- kum, tā tik vien mēs dzī -- vo -- jam.
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


