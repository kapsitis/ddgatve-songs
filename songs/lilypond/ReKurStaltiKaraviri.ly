\version "2.13.16"
%\header {
%    title = "Re, kur stalti karavīri"
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
\key f \major
\time 2/4
f8 f f( e16) d | e8 e e8. e16 | g8 g g( f16) e | g8 f f g16( a) 
\repeat volta 2 {
d8 d d( c16) bes16 | c8 c c( bes16) a16 | bes8 bes bes( a16) g
}
\alternative { { g8 f f( g16) a } {  g8 f f4 } }
} 

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 2/4
s2 | s2 | s2 | s2 
\repeat volta 2 {
bes'8 bes bes( a16) g16 | a8 a a( g16) f16 | g8 g g( f16) e 
}  
}



lyricA = \lyricmode {
Re, kur stal -- ti ka -- ra -- vī -- ri, 
ma -- ni bal -- ti bā -- le -- li -- ņi, 
Pil -- nas krū -- tis pie -- kā -- ru -- ši 
ar tē -- rau -- da ga -- ba -- lie -- mi, ga -- ba -- liem. 
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


