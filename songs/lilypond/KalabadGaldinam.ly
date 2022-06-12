\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Kālabadi galdiņami"
%}
% http://www.dailytangents.com/tautasdz/lakst/LK-051.shtml
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
\key aes \major
\time 4/8
\repeat volta 2 {
ees8 ees' ees ees | ees8 c bes aes | bes8 ees, ees ees | aes8 aes aes4  
}
\repeat volta 2 {
aes8. g16 aes8. bes16 | c8 c c16[ bes] aes8 | bes8 bes bes16[ aes] g8 | aes8 aes aes4
}
}


lyricA = \lyricmode {
Kā -- la -- ba -- di gal -- di -- ņa -- mi
Lī -- kas kā -- jas no -- lī -- kuš's?
Trā -- di rī -- di ram tai rī -- di ram tai rī -- di ra -- la -- lā!
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


