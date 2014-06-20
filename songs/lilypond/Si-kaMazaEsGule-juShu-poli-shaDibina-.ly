\version "2.13.16"
%\header {
%    title = "Sīka, maza es gulēju"
%}
% AALapas
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
\key f \major
\time 2/4
f8 g a8. g16 |
f8 g a8. g16 |
f8 g a8. g16 |
f8 d c4 |
a8 c a c |
bes8 d d4 |
c8 e g8. e16 |
f8 f f4
\bar "|."
} 

lyricA = \lyricmode {
Sī -- ka, ma -- za es gu -- lē -- ju šū -- po -- lī -- ša di -- bi -- nā! 
Ai -- jā, ai -- jā, ai -- ja -- jā, šū -- po -- lī -- ša di -- bi -- nā.  
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



