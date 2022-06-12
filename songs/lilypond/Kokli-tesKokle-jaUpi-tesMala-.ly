\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Koklītes koklēja upītes malā",AA lapas, 
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
\key c \major
\time 3/8
\repeat volta 2 { 
g'8 e e |
e8 d c |
g'8 e e |
e16[ d] c4 |
}
\repeat volta 2 { 
f8 e c |
f8 e c |
f8 e16[ d] e8 |
d8 c4 |
}
} 

lyricA = \lyricmode {
Kok -- lī -- tes kok -- lē -- ja u -- pī -- tes ma -- lā;
Bij' ma -- nim re -- dzē -- ti to kok -- lē -- tā -- ju.
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


