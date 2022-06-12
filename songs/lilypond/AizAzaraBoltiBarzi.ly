\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Aiz azara bolti bārzi"
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
\time 3/4
a8. g16 f4 f | e8. f16 g8[( a]) g4 |
bes8. a16 g4 e | f8. g16 f2 |
a8. g16 f4 f | e8. f16 g8[ a] g4 |
bes8. a16 g4 e | f8. g16 f2
\bar "|."
} 



lyricA = \lyricmode {
Aiz a -- za -- ra bol -- ti bār -- zi
Su -- dab -- re -- ņa la -- pe -- ņom.
Voi voi voi voi, voi voi voi voi,
Su -- dab -- re -- ņa la -- pe -- ņom.
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


