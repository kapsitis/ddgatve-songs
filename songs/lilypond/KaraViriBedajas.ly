\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
% title = "Kara vīri bēdājās"
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
\key e \minor
\time 2/4
e8 fis g a | b4 e | b2 | e,8 fis g a | b4 e | b2 | 
d4 b | e4 d | c8 c b b | a4 fis | g4 e | b'4. fis8 | g8 g fis fis | e2
\bar "|."
}



lyricAA = \lyricmode {
Ka -- ra vī -- ri bē -- dā -- jās, 
a -- si -- ņai -- na gais -- ma aust; 
ka -- ra vī -- ri bē -- dā -- jā -- si, 
a -- si -- ņai -- na, a -- si -- ņai -- na gais -- ma aust; 

}

lyricAB = \lyricmode {
Ah -- nungs -- voll die Krie -- ger shau'n 
blu -- tig glüht das Mor -- gen -- rot;
ah -- nungs -- voll die Krie -- ger shau -- en,
blu -- tig glü -- het, blu -- tig glüht das Mor -- gen rot. 
}


chordsA = \chordmode {
e2:m | e4:m d4:5 | e2:m | e2:m | e4:m d4:5 | e2:m |
g2:5 | c4:5 g4:5 | d4:7 g4:5 | d2:5 | e2:m | g2:5 | e4:m b4:7 | e2:m
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricAA
\new Lyrics \lyricsto "voiceA" \lyricAB
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


