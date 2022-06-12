\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kas duorzā?"
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
\time 2/4
a8 a fis4 | a8 a fis4 | g8 g g a | b8 b a4 |
a8 a fis4 | a8 a fis4 | g8 g e e | d8 d d4 
\repeat volta 2 {
a'4 fis8( g) | a4 fis | b8( a) g fis | g4 e |
g4 e8 fis | g4 e | a8( g) fis e
}
\alternative { { fis4 d } { d4 d } }
\bar "|."
} 



lyricAA = \lyricmode {
Kas duor -- zā, kas duor -- zā?
Bi -- teit’ rū -- žu duor -- ze -- ņā.
Kas duor -- zā, kas duor -- zā?
Bi -- teit’ rū -- žu duor -- ze -- ņā.
Lū -- doj, bi -- teit, caur zo -- ru zo -- rim,
Caur zo -- ru zo -- rim, caur lo -- pu lo -- pom! lo -- pom!
}


lyricAB = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _ _ _ _ _ _
Ka cy-tu at -- rūņ, lic_tū so -- vā vī -- tā,
Ka cy -- tu at -- rūņ, lic_tū so -- vā vī -- tā! vī -- tā!
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricAA
\new Lyrics \lyricsto "voiceA" \lyricAB
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


