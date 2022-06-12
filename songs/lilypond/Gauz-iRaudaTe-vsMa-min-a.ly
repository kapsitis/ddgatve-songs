\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Gauži rauda tēvs māmiņa",AA lapas, bēres
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
\key a \minor
\time 2/4
d8 f e d |
d8 a d d |
\phrasingSlurDashed
e8 d d\( d\) |
d8 c d4 |
e8 d g e |
f8 e e e |
\phrasingSlurDashed
f16[ e] d8 d\( e\) |
f8 e e4 |
\phrasingSlurDashed
e8 d f\( e\) |
d8 d d4\fermata |
\bar "|."
} 

lyricA = \lyricmode {
Gau -- ži rau -- da tēvs, mā -- mi -- ņa, smil -- tie -- nā -- i va -- dī -- dam';
Gau -- ži rau -- da tēvs, mā -- mi -- ņa, smil -- tie -- nā -- i va -- dī -- dam',
smil -- tie -- nā -- i va -- dī -- dam'.
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


