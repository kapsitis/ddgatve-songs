\version "2.13.16" 
%\header {
% title = "Upe nesa ozoliņu"
%}
% Austras dziesmu burtnīca, 31.lpp.
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
\key d \major
\time 2/4
d8 fis a,8. cis16 | d8 fis a, a | a'8 a a8. fis16 | b8 a e4 |
a8 a g[ fis16] e | d8 fis a, a | fis'8 fis g[ fis16] e | fis8 e d4
\bar "|." 
}
             


lyricA = \lyricmode {
U -- pe ne -- sa o -- zo -- li -- ņu ar vi -- sā -- mi bi -- tī -- tēm; 
U -- pe ne -- sa o -- zo -- li -- ņu ar vi -- sā -- mi bi -- tī -- tēm.
}


chordsA = \chordmode {
\time 2/4 d4:5 a4:5 | d4:5 a4:5 | b2:/fis | e4:m a4:5 | 
g4:/b a4:/cis | d4:5 fis4:m | b4:m e4:m | a4:7 d4:5
}

fullScore = <<
\new ChordNames { \chordsA }
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


