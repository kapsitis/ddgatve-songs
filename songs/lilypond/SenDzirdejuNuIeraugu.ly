\version "2.13.16"
%\header {
%    title = "Sen dzirdēju, nu ieraugu"
%}
% Skyforger, http://www.youtube.com/watch?v=YRy8I8dfb60
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
\time 2/4
\clef "treble"
\key c \minor
c8 g' g f | g ees f16[ ees] d8 | c8 g' g f | g ees f16[ ees] d8 | 
c16 g' g f ees c f d | c16 g' g f ees c f8\fermata
\bar "|."
} 


lyricA = \lyricmode {
Sen dzir -- dē -- ju, nu ie -- rau -- gu, sen dzir -- dē -- ju, nu ie -- rau -- gu: 
Die -- vam sirm -- mi ku -- me -- li -- ņi, Die -- vam sir -- mi ku -- me -- liņ.   
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


