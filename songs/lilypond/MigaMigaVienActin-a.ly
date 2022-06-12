\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Miga, miga vien' actiņa"
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
\key c \major
\time 6/8
\repeat volta 2 {
g'8 e4 f8 a4 | 
g8 f4 e\fermata f8 | 
g8 e4 f8 a4 | 
g8 f4 e\fermata f8 |
}
} 

lyricA = \lyricmode {
Mi -- ga, mi -- ga vien' ac -- ti -- ņa, 
Drīz aiz -- mi -- ga otr' ac -- ti -- ņa. 
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


