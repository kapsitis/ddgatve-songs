\version "2.13.16"
%\header {
%    title = "Uz prūšiem, zēni, jāsim"
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
\key d \minor
\time 3/8
\partial 8*1
a8 | d4 e8 | f4 g8 | f8[ e d] | d4.~ | 
d4 a'8 | c4 c8 | g4 a16[ bes] | a4.~ |
a4 a8
\repeat volta 2 {
d4 e8 | d4 a8 | g8 f4~ | f4 a8 | a8[ f] a | g8[ f] e | d4.~   
}
\alternative { { d4 a'8 } { d,4. } }
} 

lyricA = \lyricmode {
Uz prū -- šiem, zē -- ni, jā -- sim 
Ar vi -- ņiem cī -- nī -- ties. 
Tur nik -- nā a-- sins kau -- jā 
Ar vi -- ņiem spē -- ko -- ties. 
Tur
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

