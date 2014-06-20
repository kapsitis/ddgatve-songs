\version "2.13.16"
%\header {
% title = "Dievs, svētī Latviju"
%}
% J.Vītola t.dz. ar klavieru pavadījumu
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
\key g \major
\time 4/4
\repeat volta 2 { 
g'2 g4 g | b4. a8 g2 | a2 a4 a | c4. b8 a2 | b2 b4 b | d4. c8 b4 b | a2 b4 cis 
}
\alternative { { d1 } { d1 } }
\repeat volta 2 { 
a2 a4 c | b4. a8 g2 | b2 b4 d | c4. b8 a2 | c2 c4 e | d4. c8 b4 b  
}
\alternative { { b2 a4( c) | b1 } {  b2 a | g } }
}



lyricAA = \lyricmode {
Dievs svē -- tī Lat -- vi -- ju, mūs dār -- go tē -- vi -- ju, 
svē -- tī jel Lat -- vi -- ju, ak, svē -- tī jel to!
to!
Kur lat -- vju mei -- tas zied, kur lat -- vju dē -- li dzied, 
laid mums tur lai -- mē diet, mūs' Lat -- vi -- jā. 
Lat -- vi -- jā.
}

lyricAB = \lyricmode {
Seg -- ne der Let -- ten Land, das teu -- re Hei -- mat -- land, 
seg -- ne der Balt -- ten Land, ach seg -- ne es, Gott! 
Gott!
Wo Let -- ten -- töch -- ter blühn, wo Let -- ten -- söh -- ne glühn 
in Kampf und Tod zu ziehn für's Hei -- mat -- land!
Hei -- mat -- land!
}


chordsA = \chordmode {
\repeat volta 2 {
g1:5 | d2:5 g2:5 | d1:5 | d1:7 | g1:5 | d2:5 g2:5 | d2:5 a2:5 
}
\alternative { {d2:5 b2:m } { d1:5 } }
\repeat volta 2 {
d1:5 | g1:5 | e1:5 | a1:m | c1:5 | g1:5  
}
\alternative { {  g2:5  d2:7 | g2:5 c2:maj7 } { g2:5 d2:7 | g1:5 } }
  
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricAA
\lyricsto "voiceA" \new Lyrics \lyricAB
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


