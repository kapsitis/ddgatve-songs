\version "2.13.16" 
%\header {
% title = "Apkārt kalnu gāju"
%}
%Austras dziesmu burtnīca
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
\key d \minor
\time 2/4
d8 f e d | a4 a4 | d8 f e d | a'4 a 
\repeat volta 2 {
bes8 a g bes | a8 f e d | e8 a g e | d4 d4 
}
}


lyricA = \lyricmode {
Ap -- kārt kal -- nu gā -- ju, kal -- nā es uz -- kā -- pu, 
ie -- rau -- dzī -- ju mei -- te -- nī -- ti gau -- ži rau -- dā -- jo -- ti. 
}



chordsA = \chordmode {
d2:m5 | a2:5 | d2:m5 | d2:7 
\repeat volta 2 { 
g2:m5 | d2:m5 | a2:5 | d2:m
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


