\version "2.13.16" 
%\header {
% title = "Dzied, māsiņa, skaistas dziesmas"
%}
% Austras dziesmu burtnīca, 8.lpp.
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
\key d \major
\time 3/4
d4 e fis8 fis | fis8 e g[ fis] e4 | e4 e e8 e | d8 e fis2 |
d4 e fis8 fis | fis8 e g[ fis] e4 | g8 fis a4. g8 | fis8 e d2 |
e8 fis g[ b] b4 | a8 g fis[ a] a4 | g8 fis e4. e8 | d8 e fis2 |
e8 fis g[ b] b4 | a8 g fis[ a] a4 | g8 fis e4. g8 | fis8 e d2 |
\bar "|."
}


lyricA = \lyricmode {
Dzied, mā -- si -- ņa skai -- stas dzies -- mas, skais -- ti ta -- vi bā -- le -- liņ'!
Dzied, mā -- si -- ņa skai -- stas dzies -- mas, skais -- ti ta -- vi bā -- le -- liņ'!
Ai rai rī -- di, ai rai rī -- di, skais -- ti ta -- vi bā -- le -- liņ'!
Ai rai rī -- di, ai rai rī -- di, skais -- ti ta -- vi bā -- le -- liņ'!
}


chordsA = \chordmode {
d2.:5 | s4 e2:m | a2.:5 | s4 d2:5~ |
d2.:5 | s4 e2:m | s4 a2:7 | s4 d2:5 |
s4 g2:5 | s4 d2:5 | s4 a2:5 | s4 d2:5 | 
s4 g2:5 | s4 d2:5 | s4 a2:7 | s4 d2:5 | 
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


