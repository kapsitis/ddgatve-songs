\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ui, vilciņi, ui, vilciņi"
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


voiceA = \relative c' {
\clef "treble"
\key e \major
\time 2/4
\repeat volta 2 { 
e8 b' gis b16[ gis] fis8 e e e | fis8.( gis16 fis) gis fis fis | fis8 e e4  
}
} 

lyricA = \lyricmode {
Ui, vil -- ci -- ņi, ui, vil -- ci -- ņi, 
tu uz -- au -- gi ne -- rā -- jams.
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



