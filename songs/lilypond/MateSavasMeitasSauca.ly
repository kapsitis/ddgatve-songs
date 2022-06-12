\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Māte savas meitas sauca"
%}
% Austras dziesmu burtnīca, 23.lpp.
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
g'4 e8[ f] g4 c, | a'4 a a g | f4 d8[ e] f4 d | g4 g g f |
e4. d8 e4 c | f4. e8 f4 d | g4. a8 g4 e8[ d] | c1 
\bar "|."
}


lyricA = \lyricmode {
Mā -- te sa -- vas mei -- tas sau -- ca, vai ir vi -- sas va -- ka -- rā -- i, 
Rā -- mi lē -- nām, rā -- mi lē -- nām, rā -- mi lē -- nām, ram!
}


chordsA = \chordmode {
\time 4/4 c1:5 | f2.:5  e4:m | d1:m | e2.:m/g g4:7 | 
a1:m | d1:m | g1:7 | c1:5 
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


