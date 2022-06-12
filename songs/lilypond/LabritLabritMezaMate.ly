\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Labrīt, labrīt, Meža māte"
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
\key f \major
\time 2/4
f8 c' c8. c16 | d8 c bes g | 
bes bes bes8. bes16 | c8 bes a4 |
c4 c | f,16 g a bes c4 | 
bes8 g a8. f16 | g8 g f4 \bar "|."
} 

lyricA = \lyricmode {
Lab -- rīt, lab -- rīt, Me -- ža mā -- te 
ko tie ta -- vi bēr -- ni dar?
Trā -- rā ti -- di -- ri -- di -- rā, 
ko tie ta -- vi bēr -- ni dar'?
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




