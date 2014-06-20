\version "2.13.16"
%\header {
%    title = "Es apsedzu sav' galdiņu"
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


voiceA = \transpose d c { \relative c' {
\clef "treble"
\key d \major
\time 4/4 \tempo 4=120
fis4 fis8[ e] d4 d 
\time 6/4
e4 fis fis2. e4
\time 4/4
fis4 fis8[ e] d4 d
\time 6/4
e4 fis fis1 
\time 4/4

a4 a8[ g] fis4 fis 
\time 6/4
g4 a a2. g4
\time 4/4
a4 a8[ g] fis4 fis
\time 6/4
g4 a a1 


\bar "|."
} }

lyricA = \lyricmode {
Es ap -- se -- dzu sav' gal -- di -- ņu 
ar bal -- to -- i pa -- la -- dziņ';
Es ap -- se -- dzu sav' gal -- di -- ņu 
ar bal -- to -- i pa -- la -- dziņ'.
}

voiceB = \transpose d c { \relative c' {
\clef "treble"
\key d \major
%\time 4/4
s1
%\time 6/4
s1.
%\time 4/4
s1
%\time 6/4
s1.
\time 4/4
fis4 fis8[ e] d4 d 
\time 6/4
e4 fis fis2. e4
\time 4/4
fis4 fis8[ e] d4 d
\time 6/4
e4 fis d1
\bar "|."
} }

chordsA = \chordmode {
\time 4/4
c1:5 | 
\time 6/4
g2:5 c1:5 |
\time 4/4
c1:5 |
\time 6/4
g2:5 c1:5 |
\time 4/4
c1:5 | 
\time 6/4
g2:5 c1:5 |
\time 4/4
c1:5 |
\time 6/4
g2:5 c1:5 |
}


fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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


