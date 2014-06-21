\version "2.13.16"
%\header {
%    title = "Jāņa tēvs ar Jāņa māti"
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
\repeat volta 4 {
\set Score.repeatCommands = #'((volta ""))
a'8^\markup{dzied visas 4 panta rindas} a a g f f f g | 
a4 f2.
\set Score.repeatCommands = #'((volta #f))
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
Jā -- ņa tēvs ar Jā -- ņa mā -- ti, lī -- go,
Lī -- go, lī -- go, ral -- lal -- lā, 
lī -- go lī -- go ral -- lal -- lā, lī -- go!
}

lyricAB = \lyricmode {
A -- bi lie -- li dar -- bi -- nie -- ki, lī -- go, 
}

lyricAC = \lyricmode {
Viens bij' svies -- ta tai -- sī -- tā -- jis, lī -- go, 
}

lyricAD = \lyricmode {
Ot -- ris ķēr -- nes lai -- zī -- tā -- jis, lī -- go. 
}


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\lyricsto "voiceA" \new Lyrics \lyricAA
\lyricsto "voiceA" \new Lyrics \lyricAB
\lyricsto "voiceA" \new Lyrics \lyricAC
\lyricsto "voiceA" \new Lyrics \lyricAD
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



