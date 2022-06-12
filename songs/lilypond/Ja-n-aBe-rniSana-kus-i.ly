\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Jāņa bērni sanākuši"
%}
% 
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
\key f \major
\time 4/4
\repeat volta 2 {
a'8 a a g f f f g | 
a4 f2.
}
\repeat volta 2 {
c'8 c c bes c a a4 | c8 c c bes c a a4 | c4 a2. 
}
} 

voiceB = \relative c' {
\clef "treble"
\key f \major
\time 4/4
\repeat volta 4 {
s1 | s1 
}
\repeat volta 2 {
a'8 a a g a f f4 | a8 a a g a f f4 | a4 f2.
}
}

lyricAA = \lyricmode {
Jā -- ņa bēr -- ni sa -- nā -- ku -- ši, lī -- go, 
}

lyricAB = \lyricmode {
Su -- ņi mē -- les iz -- ko -- du -- ši, lī -- go.
}

lyricB = \lyricmode {
Lī -- go, lī -- go, ral -- lal -- lā, 
Lī -- go, lī -- go, ral -- lal -- lā, lī -- go. 
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceA" \lyricAA
\new Lyrics \lyricsto "voiceA" \lyricAB
\new Lyrics \lyricsto "voiceB" \lyricB
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



