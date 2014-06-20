\version "2.13.16"
%\header {
% title = "Plata upe, šaura laipa"
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
\time 2/4
a'8. b16 c8 d | e8 c b a | e'4 d16[ e] f[ d] | e2 |
f8 e d e | c8 b a g | e'8. d16 c8 b | a2
\bar "|."
}



lyricAA = \lyricmode {
Pla -- ta u -- pe, šau -- ra lai -- pa, kā tas var būt? 
Aiz tās u -- pes za -- ļa zā -- le, tas gan var no -- tikt. 
}

lyricAB = \lyricmode {
Brei -- ter Fluß, ein Brett -- lein drü -- ber, wie kann das sein?
Hin -- term Fluß die grü -- ne Wie -- se, ja, das kann ge -- scheh'n.
}


chordsA = \chordmode {
\time 2/4
a4:m d4:m | c4:5 a4:m | e4:5 d4:m6 | e2:5 | 
d2:m | c2:5 | d4:m e4:7 | a2:m  
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


