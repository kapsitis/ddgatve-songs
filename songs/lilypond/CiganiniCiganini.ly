\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Čigāniņi, čigāniņi"
%}
%#(set-global-staff-size 18)
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

chordsA = \chordmode {
\time 2/4
g2:5 | g2:5 | g2:5 | g2:5 | 
g2:5 | g2:5 | g2:5 | g2:5 | 
}

voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
%MS
b'8 d d d | d8 c b a | d4 b8 b  |  b2 |
%ME
d8 d d d | d c b a | d4 b8 b | b2\fermata
\bar "|."
} 

voiceB = \relative c' {
\clef "treble"
\key g \major
\time 2/4
g'8 b b b | b8 a g e | b'4 g8 g  |  fis2 |
b8 b a b | b a g fis | b4 g8 g | fis2\fermata
} 


lyricA = \lyricmode {
\set stanza = #"1." Či -- gā -- ni -- ņi, či -- gā -- ni -- ņi, to -- ta -- ri, to!
Vie -- nu vie -- tu, vie -- nu vie -- tu, to -- ta -- ri, to!
}


fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



