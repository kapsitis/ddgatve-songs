\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Alus muca pagrabā"
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
\key g \major
\time 6/8
g4 fis8 g4 a8 | b4 c8 b[ a] g | a4 b8 a4 d,8 | b'4 a8 g4. |
d4 fis8 g4 a8 | b4 c8 b[ a] g | a4 b8 a4 d,8 | b'4 a8 g4. |
\bar "|."
} 

lyricA = \lyricmode {
A -- lus mu -- ca pa -- gra -- bā -- i, di -- vi kan -- nas gal -- di -- ņā.
A -- lus mu -- ca pa -- gra -- bā -- i, di -- vi kan -- nas gal -- di -- ņā.
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


