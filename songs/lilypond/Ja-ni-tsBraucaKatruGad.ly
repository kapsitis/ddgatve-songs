\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Jānīt's brauca katru gadu"
%}
% Katrīna Riekstiņa, #53 (Iļģi)
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
\time 4/4
f8 f d d a d d4 | c8 e e e c e e4 | 
f8 f d d a d d4 | c8 e e e c e e4 | 
\bar "|."
} 

chordsA = \chordmode {
\time 4/4 
d1:m | c1:5 | d1:m | c1:5
}

lyricA = \lyricmode {
%Vi -- sa ze -- mes zā -- le zied, 
%pa -- par -- dī -- te ne -- zie -- dēj',
%Vi -- sa ze -- mes zā -- le zied, 
%pa -- par -- dī -- te ne -- zie -- dēj'.
Jā -- nīt's brau -- ca kat -- ru gad',
At -- ved zā -- ļu ve -- zu -- miņ', 
Jā -- nīt's brau -- ca kat -- ru gad',
At -- ved zā -- ļu ve -- zu -- miņ'. 
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



