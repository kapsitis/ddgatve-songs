\version "2.13.16"
%\header {
%    title = "Pāri muklājiem un purviem (Sakarnieks)"
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
\key g \minor
\time 3/4
ees8 ees g4. bes8 | a8 g d'4 d | d,8 d g4. bes8 | a8 g d'2 |
d8 d c4. ees8 | d8 c bes4 g | bes8 bes a4. c8 | bes8 a g2 |
d8 d g8. g16 g8 g | d8 d g8. g16 g8 g | d8 d g4 r | d8 d g4 r  
} 

lyricA = \lyricmode {
Pā -- ri muk -- lā -- jiem un pur -- viem 
so -- ļo sa -- kar -- nie -- ku vads, 
Un caur pī -- pes zi -- liem dū -- miem 
drū -- mi rau -- gās vi -- ņu skats. 
Tum -- bā tum -- ba -- ra -- sa, tum -- bā tum -- ba -- ra -- sa, 
Tum -- bā bums, tum -- bā bums. 
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


