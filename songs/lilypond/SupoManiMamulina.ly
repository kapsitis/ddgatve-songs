\version "2.13.16" 
%\header {
% title = "Šūpo mani, māmuliņa"
%}
% Austras dziesmu burtnīca, 30.lpp.
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
\key g \major
\time 2/4 d8 d g g
\time 3/4 b8 a a4. a16[ b] 
\time 2/4 c8 c b a 
\time 3/4 a8 fis g2~ 
\time 2/4 g4 r 
\repeat volta 2 {
d8 d g g 
\time 3/4 b8 a a4. a16[ b] 
\time 2/4 c8 c b a 
\time 3/4 a8 fis g2~
\time 2/4 g4 r
}
}


lyricA = \lyricmode {
Šū -- po ma -- ni, mā -- mu -- li -- ņa, vā -- lo -- dzī -- tes šū -- pu -- lī, 
Lai es lo -- ku va -- lo -- di -- ņu, kā lo -- cī -- ja vā -- lo -- dzīt'. 
}


chordsA = \chordmode {
\time 2/4 g2:5
\time 3/4 a2.:m
\time 2/4 d2:7 
\time 3/4 s4 g2:5 
\time 2/4 s2 
\repeat volta 2 {
s2
\time 3/4 a2.:m
\time 2/4 d2:7 
\time 3/4 s4 g2:5 
\time 2/4 s2
}
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


