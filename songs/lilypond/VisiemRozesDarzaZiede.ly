\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
% title = "Visiem rozes dārzā ziede"
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
a'8[ b] c4 c8 d | a4 a a8 e | e'4 e f8 e | d4 d8[ f] \times 2/3 { e8[ d] e } |
a,8[ b] c4 c8 d | a4 a a8 e | a8[ b] c4 c8 d | a8 g a2  
\bar "|."
}



lyricAA = \lyricmode {
Vi -- siem ro -- zes dār -- zā zie -- de, ma -- nas ro -- zes ne -- zie -- dē -- ja, 
vi -- siem ro -- zes dār -- zā zie -- de, ma -- nas ro -- zes ne -- zie -- dēj.
}

lyricAB = \lyricmode {
Ro -- sen blühn in al -- len Gär -- ten, nur mein Gärt -- chen schmü -- cket kei -- ne, 
Ro -- sen blühn in al -- len Gär -- ten, mei -- ne Ro -- sen blü -- hen nicht!
}


chordsA = \chordmode {
a4:m f2:5 | d2:m a4:m | a2:m d4:m | g2:7 c4:5 |
a4:m f2:5 | d2:m a4:m | a2:m d4:m7 | a2.:m
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


