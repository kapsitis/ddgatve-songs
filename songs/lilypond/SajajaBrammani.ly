\version "2.13.16"
%\header {
%    title = "Sajāja Brammaņi"
%}
% F/g "Laiva", rokraksts (Perkons.pdf)
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
\time 4/4
\clef "treble"
\key d \minor
d8 d4 d8 f4\( f8\) e8 | f4 e8 d d2 | f8 f g4 f8 f e4 | d8 c e d d c c4 | c4 d2. | r1  
\bar "|."
} 


lyricA = \lyricmode {
Sa -- jā -- ja bram -- ma -- ņi, to -- ta -- ri to, 
Rai -- tai -- tā, rai -- tai -- tā, ra -- du ri -- du rai -- tai -- tā, ro -- tā!   
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


