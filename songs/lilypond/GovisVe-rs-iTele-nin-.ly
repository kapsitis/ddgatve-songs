\version "2.13.16"
%\header {
%    title = "Govis, vērši, telēniņ"
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
\time 2/4
\repeat volta 2 {
g'8 e g e | g8 e g4 | 
b,8 b g'8. f16 | e8 e e4 | 
b4 d8. e16 | f8 d f r |
b,8 b g'8. f16 | e8 e e r |
}
} 

lyricA = \lyricmode {
Go -- vis, vēr -- ši, te -- lē -- niņ', 
Ai -- tas, jē -- ri, ku -- me -- liņ'.
Ā -- ā -- ā, a -- pa -- pa,  
Ai -- tas, jē -- ri, ku -- me -- liņ'.
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


