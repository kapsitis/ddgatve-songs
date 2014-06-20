\version "2.13.16"
%\header {
%    title = "Spīguļo, saulīt"
%}
% Katrīna Riekstiņa, #59
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key d \minor
\override Staff.TimeSignature #'stencil = ##f
%\override Score.BarNumber #'stencil = ##f
\repeat volta 2 {
\set Score.repeatCommands = #'((volta ""))
\time 11/8
f8.^\markup{9 reizes} d16 d8 d d 
f8. d16 d8 
f8. d16 d8 
\set Score.repeatCommands = #'((volta #f))
} \break
\time 15/8
f8. d16 d8 f4 d e c8. c16 f8 d d4 | \break
\time 16/8
e8. d16 d8 d e8. d16 d8 d e bes bes bes c c c4
\bar "|."
} 



lyricA = \lyricmode {
Spī -- gu -- ļo, sau -- līt, 
spī -- gu -- ļo, spī -- gu -- ļo,
met mel -- nu jū -- rā, velc bal -- tu mu -- gu -- rā, 
lai ve -- lē -- jas jū -- ras mei -- tas 
ar o -- zo -- la vā -- lī -- tēm. 
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



