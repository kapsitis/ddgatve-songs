\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = " Baltaitiņa jūru pelda ",Budēlīši, jūra
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
\key g \minor
\time 3/4
d'8 c16[ e] d4 a8[ bes] |
c8 d c4 g8[ a] |
bes8 a g d( d4) |
\time 2/4
g8 g a16[ bes] c8 |
\time 3/4
d8 d g,2\fermata |
\bar "|."
}

lyricA = \lyricmode {
Balt -- ai -- ti -- ņa jū -- ru pel -- da, jū -- ru pel -- da si -- dra -- bi -- ņa ra -- dzi -- ņiem.
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


