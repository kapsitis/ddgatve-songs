\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Zemīt, mana tēvu zeme"
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
\time 3/4
c4\mf g' e8 c | a'4 g f16[ e16] d8 |
c4 f8[ g] a f 
\time 4/4
e4 d c2 
\time 3/4
c4 c' a8 f | a4 g f16[ e16] d8 |
c4 f8[ g] a f 
\time 4/4
e4 d c2
\bar "|."
} 

lyricA = \lyricmode {
Ze -- mīt, ma -- na tē -- vu ze -- me 
Gau -- jas lī -- ču ma -- li -- ņā.
Uz kal -- ni -- ņa tī -- ra mai -- ze,
Le -- jā skai -- drais ū -- den -- tiņš.
} 

chordsA = \chordmode {
c2. f2 g4 c4 f2 c4 g4 c2
a2 f4 f4 g2 c4 f2 c4/g g4:7 c2
}

fullScore = <<
\new ChordNames { \chordsA }
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


