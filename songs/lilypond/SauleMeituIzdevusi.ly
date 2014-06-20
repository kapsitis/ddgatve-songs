\version "2.13.16" 
%\header {
% title = "Saule meitu izdevusi"
%}
% Gadskārtu ieražu dziesmas, p. 298
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
\key b \minor
\time 4/4
fis4 fis fis a | g8[ fis] e[ g] fis4. d8 | 
fis4 fis fis a | g8[ fis] e[ g] fis4. d8 | 
d4 d e e | b4 b fis'4. e8 | d4 d e e | b4 b b2
\bar "|."
}


lyricA = \lyricmode {
Sau -- le mei -- tu iz -- de -- vu -- si, Sau -- le mei -- tu iz -- de -- vu -- si, 
Lūdz Pēr -- ko -- ni pa -- nāk -- šo -- si, lūdz Pēr -- ko -- nu pa -- nāk -- šos. 
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


