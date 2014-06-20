\version "2.13.16"
%\header {
% title = "Dievs dod mūsu tēvu zemei"
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
\key a \major
\time 2/4
a'4 a | a8 gis a gis | a4 b | cis4 cis | cis8 d e d | cis4 b |
a4 a | e8 e a gis \time 3/4 fis4 e2 \time 2/4
a4 a | e8 e a gis \time 3/4 fis4 e2
\bar "|."
}



lyricAA = \lyricmode {
Dievs dod mū -- su tē -- vu ze -- mei, 
Dievs dod mū -- su tē -- vu ze -- mei,
zie -- du lai -- kus pie -- dzī -- vo -- ti, 
zie -- du lai -- kus pie -- dzī -- vo -- ti.
}

lyricAB = \lyricmode {
Gott, gib uns' -- rem Hei -- mat -- lan -- de,
Gott, gib uns' -- rem Hei -- mat -- lan -- de 
se -- gens -- rei -- che Blü -- te -- zei -- ten,
se -- gens -- rei -- che Blü -- te -- zei -- ten. 
}


chordsA = \chordmode {
a2:5 | b2:m7 | a4:5 b4:m | a2:5 | fis2:m | a4:5 b4:m |
a2:5 | e4:5 fis4:m 
\time 3/4 b4:5 e2:5 
\time 4/4 fis2:m | e4:5 fis4:m 
\time 3/4 b4:m e2:5
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

