\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Zaļa tautu miežu rija"
%}
% http://www.dailytangents.com/tautasdz/lakst/LK-119.shtml
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
\time 2/4
g'8 d g d | g8 b d8. b16 | c8 d16[ c] b8 b | a8 a g4 |
g16 g d d g g d d | g8 b d8. b16 | c8 d16[ c] b8 b | a8 a g4 
\bar "|."
}


lyricA = \lyricmode {
Za -- ļa tau -- tu mie -- žu ri -- ja,
Zaļš o -- zo -- la spri -- gu -- līt's. 
Za -- ļa tau -- tu, za -- ļa tau -- tu mie -- žu ri -- ja,
Zaļš o -- zo -- la spri -- gu -- līt's.
}



fullScore = <<
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


