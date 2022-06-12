\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Pie Dieviņa gari galdi"
%   (sk. "Pie Dieviņa gari galdi")
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
\key d \major
\time 2/4
fis8 fis fis e16[( fis]) | g8 g g fis | e4 g4 | fis4. e8 |
d8 d d cis16[( d]) | e8 e e d | cis4 fis8[( e]) | fis4. r8 |
a8 a a g16[( a]) | b8 b b a | g4 b | a4. g8 |
fis8 fis fis e16[( fis]) | g8 g g fis | e4 g | fis4. r8
\bar "|."
} 



lyricA = \lyricmode {
Pie Die -- vi -- ņa ga -- ri gal -- di, ga -- ri gal -- di,
Tur sēž  pa -- ti mī -- ļā Mā -- ra, mī -- ļā Mār'.
Pie Die -- vi -- ņa ga -- ri gal -- di, ga -- ri gal -- di,
Tur sēž  pa -- ti mī -- ļā Mā -- ra, mī -- ļā Mār'.
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


