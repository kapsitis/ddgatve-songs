\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kas to teica, tas meloja"
%    title = "Ligojam, ligojam"
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
g'8 g e e | g8 g e e | g8[ a] b4 |
g8 g a a | g8 a g g | g8[ fis] e4
\bar "|."
} }


voiceB = \transpose e a { \relative c' {
\clef "treble"
\key e \minor
\time 2/4
e8 e e e | e8 e e e | e8[ fis] g4 |
e8 e fis fis | e8 fis e e | e4 e4
\bar "|."
} }

lyricA = \lyricmode {
Kas to tei -- ca, tas me -- lo -- ja, lī -- go, 
Ka ir ga -- ra Jā -- ņu nak -- te, lī -- go. 
}

chordsA = \chordmode {
\time 2/4
a2:m | a2:m | a4:m e4:m | a2:m | a2:m | a2:m |
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
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


