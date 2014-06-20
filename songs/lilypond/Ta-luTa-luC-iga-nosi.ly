\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Tālu, tālu čigānosi
\layout {
indent = #0
ragged-last = ##f
}


chordsA = \chordmode {
\time 2/4
\repeat volta 2 {
g2:m | g2:m | c2:5 | c4:5 d4:m |
}   
}

%voiceA = \relative c' {
%\clef "treble"
%\key c \major
%\repeat volta 2 {
%\time 2/4
%g'8 g g g |
%g8 g f e |
%d8 d g4 |
%f8 f e4 |
%g8 g g g |
%g8 g f e |
%d8 d g4 |
%f8 f e4 |
%}
%}


%voiceB = \relative c' {
%\clef "treble"
%\key c \major
%\repeat volta 2 {
%\time 2/4
%e8 e e e |
%e8 e d c |
%d8 d e4 |
%d8 d c4 |
%e8 e e e |
%e8 e d c |
%d8 d e4 |
%d8 d c4 |
%}
%}

voiceA = \relative c' {
\clef "treble"
\key d \minor
\time 2/4
\repeat volta 2 {
g'8 g g g |
g8 f e d |
c8 c f4 |
e8 e d4 |
}
}


lyricA = \lyricmode {
Tā -- lu, tā -- lu či -- gā -- no -- si, tol -- da -- ro, tol -- da -- ro,
}

lyricB = \lyricmode {
zie -- mas -- svēt -- ku va -- ka -- rā -- i, tol -- da -- ro, tol -- da -- ro.
}


fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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


