\version "2.13.16"
%\header {
%    title = "Zirgi zviedza"
%}
% Skyforger, http://www.youtube.com/watch?v=O-h8AWK4OcE
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
\time 2/4
\partial 4*1
\repeat volta 2 {
bes'8 bes | a4 a | bes8 a g f16\( e\) | d4 a' | f8 f8 f16[ g] a8 | g8 f16[ e] d4~ | d4
}
} 

lyricA = \lyricmode {
Zir -- gi zvie -- dza, ai -- jā, jo -- di _ brau -- ca, 
u -- pīt'  te -- cēj'  čurk -- stē -- dam',
} 

lyricB = \lyricmode {
Ai -- jā ri -- di, ai -- jā, rid -- ri -- di ral -- lā
u -- pīt'  te -- cēj'  čurk -- stē -- dam'.
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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



