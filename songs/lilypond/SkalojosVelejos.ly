\version "2.13.16" 
%\header {
% title = "Skalojosi, velējosi"
%}
% Austras dziesmu burtnīca, 27.lpp.
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
\time 6/8
c4 e8 g4 e8 | c4 e8 f[ e] d | c4 e8 g4 e8 | d8[ e] d c4. |
\repeat volta 2 {
c8 c c c c c | f4 a8 c8[ b] a | g4 e8 g4 e8 | d8[ e] d c4.
}
}


lyricA = \lyricmode {
Ska -- lo -- jo -- si, ve -- lē -- jo -- si 
strauj -- u -- pī -- tes ma -- li -- ņā. 
Ai -- rī -- du ai -- rī -- du ai -- rai -- rī -- du, 
strauj -- u -- pī -- tes ma -- li -- ņā. 
}


chordsA = \chordmode {
\time 6/8
c2.:5 | s4. f4.:5 | c2.:5 | g4.:7 c4.:5 
\repeat volta 2 {
s4. c4.:7 | f2.:5 | c2.:5 | g4.:7 c4.:5
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


