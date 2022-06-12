\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Div laivenis peļd pa jyuru"
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

voiceA = \relative c'' {
\clef "treble"
\key d \major
\time 2/4
\repeat volta 2 {
a4 a | fis4 d | fis4( a8) fis 
}
\alternative { { e4 a } { e4 e } }
\repeat volta 2 {
cis8 e e e | cis8 e e e | d4( cis8) b | a2
}
} 



lyricA = \lyricmode {
Div lai -- ve -- nis peļd pa jyu -- ru, jyu -- ru,
Nīd -- ris vi -- ņ(i), nīd -- ris vi -- ņ(i) lei -- go -- jās.
}


fullScore = <<
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


