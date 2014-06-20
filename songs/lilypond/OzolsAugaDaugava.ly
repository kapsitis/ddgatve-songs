\version "2.13.16"
%\header {
%    title = "Ozols auga Daugavā"
%}
% Budēlīši, p.24
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
\time 13/4
g''4 e8[ d] e f g4 d c g c8 c d f e4 d8[ b] c4. e8 |
g8[ f] e[ d] e f g4 d c g  c8 c d f e4 d c2
\bar "|."
}


lyricA = \lyricmode {
O -- zols au -- ga Dau -- ga -- vā -- i le -- do -- jā -- mi la -- pi -- ņā -- mi, 
O -- zols au -- ga Dau -- ga -- vā -- i le -- do -- jā -- mi la -- pi -- ņām.
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


