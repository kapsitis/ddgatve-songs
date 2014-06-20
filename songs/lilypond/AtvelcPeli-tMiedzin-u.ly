\version "2.13.16"
%\header {
%    title = "Atvelc, pelīt, miedziņu"
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
\time 5/4
\stemDown
\slurDashed
c'8 a c a c( a) c( a) c r | 
c8( a) c a c( a) c( a) c r 
\repeat volta 2 {
\set Score.repeatCommands = #'((volta ""))
\time 4/4
c8(^\markup{Dzied visas 3 rindas} a) c( a) c( a) c r |
c8( a) c( a) c( a) c r | 
\set Score.repeatCommands = #'((volta #f))
}
d8 d d a c4 c8 a | 
c8( a) c( a) c( a) c r |
c8( g) d'4 c8 g d'4 | 
\repeat volta 2 {
c8( a) c a c a c r |
c8 a c a c a c r | 
}
} 

lyricA = \lyricmode {
At -- velc pe -- līt, mie -- dzi -- ņu 
Caur cep -- ļa lo -- dzi -- ņu,
Caur pir -- ti -- ņu, caur ri -- ji -- ņu, 
Ka tā ka -- ķa as -- tī -- te ne -- re -- dzē -- ja, 
Ie -- liec ma -- za -- jam bēr -- ni -- ņam gul -- ti -- ņā 
Pa -- šā gul -- tiņ's ga -- li -- ņā.  
} 

lyricB = \lyricmode {
_ _ _ _ _ _ _ 
_ _ _ _ _ _ 
Caur klē -- ti -- ņu, caur na -- mi -- ņu,
_ _ _ _ _ _ _
_ _ _ _
_ _ _ _ _
Ē __ _ _ _ _ _ 
ē __ _ _ _ _ _
}

lyricC = \lyricmode {
_ _ _ _ _ _ _ 
_ _ _ _ _ _ 
Caur sliek -- snī -- ti, caur krās -- nī -- ti, 
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
\lyricsto "voiceA" \new Lyrics \lyricC
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


