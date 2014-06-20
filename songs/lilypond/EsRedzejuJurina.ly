\version "2.13.16" 
%\header {
% title = "Es redzēju jūriņā"
%}
% Austras dziesmu burtnīca, 14.lpp.
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
\time 4/4
\repeat volta 2 {
e4 f8 g8~ g4 e | a4 g8 f~ f4 e | g8 d~ d2.~ | d2 r2 |
d4 e8 f8~ f4 a | g4 f8 e~ e4 d4 | e8 c~ c2.~ | c2 r2 |
e4 g8 c~ c4 b | d4 c8 b~ b4 a | a8 d,~ d2.~ | d2 r2 |
d4 e8 f~ f4 a | g4 f8 e~ e4 d4 | e8 c8~ c2.~ | c2 r2
}  
}


lyricA = \lyricmode {
Es re -- dzē -- ju  jū -- ri -- ņā -- i, di -- dam!
U -- gun -- ti -- ņas mir -- go -- jo -- ti di -- dam!
Jū -- ras mā -- te tur žā -- vē -- ja, di -- dam!
Sa -- vu zel -- tu, sud -- ra -- bi -- ņu, di -- dam!
}


chordsA = \chordmode {
c1:5 | s1 | g1:5 | s1 |
g1:7 | s1 | c1:5 | s1 |
s1 | a1:m | d1:m | s1 |
s1 | g1:7 | c1:5 | s1
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


