\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Guli saldā miedziņā"
%}
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
\key a \minor
\time 4/4
\stemUp
c'8 a bes a bes a c r | 
c8 a bes a bes a c r |
\repeat volta 2 {
c8 a bes a bes a16[ c] c8 r |
c8 a bes a bes a16[ c] c8 r |
c8 a bes a bes a c r | 
c8 a bes a bes a c r |
}
} 

lyricA = \lyricmode {
Ē __ _ _ _ _ _ _  ei -- ju -- ei -- ju ē __ _ _ 
Gu -- li sal -- dā mie -- dzi -- ņā
Kā pe -- lī -- te mi -- dzi -- ņā. 
Ē __ _ _ _ _ _ _ ē __ _ _ _ _ _ _
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


