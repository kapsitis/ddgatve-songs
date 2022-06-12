\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Trīs gadiņi audzināju"
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
\key d\major 
\time 6/8 
a'4\mf fis8 a4 fis8 | b4 b8 b4 b8 |
a4 a8 g4 g8 | fis4 fis8 fis4. |
a4 fis8 a4 fis8 | b4 b8 b( a) g |
a4 a8 g4 g8 | fis4 fis8 fis4. 
\bar "|."
} 

voiceB = \relative c' {
fis4 d8 fis4 d8 | g4 g8 g4 g8 |
fis4 fis8 e4 e8 | d4 d8 d4.
fis4 d8 fis4 d8 | g4 g8 g( fis) e |
fis4 fis8 e4 e8 | d4 d8 d4.  
\bar "|."
} 

lyricA = \lyricmode {
Trīs ga -- di -- ņi au -- dzi -- nā -- ju stal -- lī bē -- ru ku -- me -- liņ,
Trīs ga -- di -- ņi au -- dzi -- nā -- ju stal -- lī bē -- ru ku -- me -- liņ.
}

chordsA = \chordmode {
d2. g2. d4. a4. d2.
d2. g2. d4. a4. d2.
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



