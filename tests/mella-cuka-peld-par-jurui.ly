\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Mella cūka peld par jūru"
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

voiceA = \relative c {
\clef "bass"
\key b \major
\time 3/4
dis4 dis cis8 dis | \time  2/4 e dis cis b | \time 3/4 fis'4 fis eis8 fis | \time 2/4 gis fis dis fis | b, b b b | b b dis8. cis16 | b8 b b r 

\bar "|."
} 



lyricA = \lyricmode {
Mel -- la cū -- ka peld par jū -- ru, mel -- la cū -- ka peld par jū -- ru, dum -- mai, dum -- mai, dum -- mai dū -- di dum -- mai da.
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


