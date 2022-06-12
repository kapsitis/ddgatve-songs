\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Pār purviem, pār mežiem"
%}
% Austras dziesmu burtnīca, 25.lpp.
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
\time 6/8
d8 d a d d a | d8 d b' a4 fis8 | g8 g16[ fis] e8 fis8 fis16[ e] d8 | 
e8 a, a d4 fis8 |  g8 g16[ fis] e8 fis8 fis16[ e] d8 | e8 a,8 a d4. 
\bar "|." 
}


lyricA = \lyricmode {
Pār pur -- viem, pār me -- žiem sau -- lī -- te lē -- ca, 
sil -- ma -- lā mei -- ti -- ņa li -- ni -- ņus plū -- ca, 
sil -- ma -- lā mei -- ti -- ņa li -- ni -- ņus plūc.
}


chordsA = \chordmode {
\time 6/8 
d2.:5 | g4.:5 fis4.:m | e4.:m d4.:5 | 
a4.:7 d4.:5 | e4.:m d4.:5 | a4.:7 d4.:5
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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


