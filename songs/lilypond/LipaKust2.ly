\version "2.13.16"
%\header {
%    title = "Lipa kust"
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
\time 2/4
a8 f f4 | a8 f f4 |
a8 a bes8. a16 | a8 g g4 |
g8 e e4 | g8 e e4 |
g8 g a8. g16 | g8 f f4
\repeat volta 2 {
a8 a g f | f8 e e e |
bes'8 bes a g | g8 f f4
}
}


lyricA = \lyricmode {
Li -- pa kust, li -- pa kust,
Kas tū li -- pu kus -- ty -- noj; 
Li -- pa kust, li -- pa kust,
Kas tū li -- pu kus -- ty -- noj; 
Ru -- dzu mai -- ze, kvī -- šu mai -- ze,
Tei tū li -- pu kus -- ty -- noj.
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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


