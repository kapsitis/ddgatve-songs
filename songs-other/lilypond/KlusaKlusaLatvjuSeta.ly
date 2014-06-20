\version "2.13.16"
%\header {
%    title = "Klusa, klusa latvju sēta"
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
\key g \major
\time 3/4
d8 c b4 b | e8 d d4 c | d8 d fis4. fis8 | d8 d g4~ g |
d8 c b4 b | e8 d d4 c | d8 d fis4. fis8 | d8 d g4~ g |
\time 3/8
\repeat volta 2 {
d4 d8 | g4. | e4 e8 | a4. | fis4 fis8 | a4. | g4 g8 | b4. |
d,8 d16 d d8 | g8( g) fis | e8( e) e | a4 g8 | fis8 d d | d8 e fis | g4. |
d8 d d | g8 g fis | e8 e e | a4 g8 | fis8 d d | d8 e fis | g4.
}
} 

lyricA = \lyricmode {
Klu -- sa, klu -- sa lat -- vju sē -- ta, sir -- ma mā -- te vie -- na raud; 
Un pār vi -- ņas bā -- liem vai -- giem as' -- ru pēr -- les āt -- ri rit. 
Lat -- vi -- jā, Lat -- vi -- jā spī -- dēs mums uz -- va -- ra! 
Kam rau -- dat jūs dai -- ļās lat -- vju mei -- čas? 
Sē -- ro -- jiet, pie -- mi -- niet mūs. 
Tik -- līdz kā no -- rī -- bēs pē -- dē -- jais šā -- viens, 
Lat -- vi -- ja brī -- va tad būs. 
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


