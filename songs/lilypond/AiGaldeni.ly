\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ai, gaļdeni"
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
\key f \major
\time 5/4
g4 g g( a) g | f4 a a2 a4 |
bes4 g bes2 g4 | bes4 a a2.
\bar "|."
} 



lyricA = \lyricmode {
Ai, gaļ -- de -- ni, ai, gaļ -- de -- ni,
Kai tev skai -- ški pī -- de -- rēj’!
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


