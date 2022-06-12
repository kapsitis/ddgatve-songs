\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Jānīšami treji vārti"
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

voiceA = \transpose e a { \relative c' {
\clef "treble"
\key e \minor
\time 2/4
g'8 g fis e | fis8 e e\( e\)
\time 4/4
e4 fis2. | g4 e2.
\time 2/4
g8 g fis e | fis8 e e\( e\)
\time 4/4
e4 fis2. | g4 e2. 
\bar "|."
} }

lyricA = \lyricmode {
Jā -- nī -- ša -- mi tre -- ji vār -- ti, lī -- go, lī -- go!
Vi -- sus tre -- jus vi -- ri -- nā -- ja: lī -- go, lī -- go!
} 

lyricB = \lyricmode {
go. Lī -- go, lī -- go! lī -- go, lī -- go!
} 

voiceB = \transpose e a { \relative c' {
\clef "treble"
\key e \minor
\time 2/4
a2^\markup{(velk no iepr. panta)} | s2
\time 4/4
e4 e2. | e4 e2.~
\time 2/4
e2~ | e2
\time 4/4
e4 e2. | e4 e2.
\bar "|."
} }


fullScore = <<
\new StaffGroup <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
>>
}
\new Staff {
<<
\new Voice = "voiceB" { \voiceOne \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceB" \lyricB
>>
}
>>
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


