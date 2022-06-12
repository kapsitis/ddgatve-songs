\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kūši, kūši, jauki, jauki"
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

voiceA = \transpose d a { \relative c' {
\clef "treble"
\key d \minor
\time 2/4
f8 e d e | f8 g f e | d8[ e] f4 | f8[ bes] a4 |
e8 e g g | f8 e d d | e4 g | f8[ e] d4
\bar "|."
} }



lyricA = \lyricmode {
Kū -- ši, kū -- ši, jau -- ki, jau -- ki, lei -- gū, lei -- gū, 
kad at -- nuo -- ce Juo -- ņa dī -- na, lei -- gū, lei -- gū!
}

chordsA = \chordmode {
\time 2/4
a2:m | a2:m | a2:m | a4:m e4:m | 
e2:m | a2:m | g2:5 | a2:m |
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
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


