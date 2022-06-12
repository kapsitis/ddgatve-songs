\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Šūpojiesi, šūpulīt"
%}
% Austras dziesmu burtnīca, 29.lpp.
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
\time 4/4
fis4 fis e4. d8 | d4 cis cis2 | b'4 b a4. g8 | g4 fis fis2 |
fis4 fis a4. d,8 | d4 cis cis2 | a4 cis e4. cis8 | e4 d d2 
\bar "|."
}


lyricA = \lyricmode {
Šū -- po -- jie -- si, šū -- pu -- līt, auk -- lē lie -- lu bā -- lē -- liņ';
Šū -- po -- jie -- si, šū -- pu -- līt, auk -- lē lie -- lu bā -- lē -- liņ'.
}


chordsA = \chordmode {
\time 4/4
d1:5 | a1:5 | s1 | d1:5 | s1 | a1:5 | a1:7 | d1:5
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


