\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Lieli bērni brīnījās",AA lapas
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
\time 2/4
f8 d f d |
f8 d g r8 |
f8 d f d |
f8 d g r8 |
\bar "|."
} 

lyricA = \lyricmode {
Ai -- jā, ai -- jā, ē -- ē -- e! Ai -- jā, ai -- jā ē -- ē -- e!
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


