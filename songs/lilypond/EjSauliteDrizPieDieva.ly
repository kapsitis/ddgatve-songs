\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
% title = "Ej, saulīte, drīz pie Dieva"
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
\key a \minor
\time 3/4
c'4 c a8 b | c4 a b8 a | c4 b a8 a | b4 g a\fermata |
c4 c a8 b | c4 a b8 a | c4 b a8 a | b4 g a\fermata |
\times 2/3 { c8[ b a] } e'4 d | \times 2/3 { c8[ b a~] } a2\fermata 
\bar "|."
}



lyricAA = \lyricmode {
Ej, sau -- lī -- te, drīz pie Die -- va, dod man svē -- tu va -- ka -- ru. 
Bar -- gi kun -- gi dar -- bu de -- va, ne -- dev' svē -- ta va -- ka -- ra. 
Ū! __ _ _ _ 
}

lyricAB = \lyricmode {
Zu Gott ei -- le bald, o Son -- ne, gib uns Fei -- er -- a -- bend -- ruh'!
Ar -- beit ga -- ben stren -- ge Her -- ren, doch die A -- bend -- ru -- he nicht.
Uh! __ _ _ _
}


chordsA = \chordmode {
\time 3/4
a2.:m | a2.:m | a4:m e4:m f4:5 | g4:7 e4:m a4:m |
a2.:m | a2.:m | d4:m7 g4:5 f4:5 | g4:5 c4:5 f4:5 |
f2.:maj7 | a2.:m 

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


