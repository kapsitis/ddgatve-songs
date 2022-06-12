\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Mammiņa mīļā"
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

chordsA = \chordmode {
\time 6/8
\repeat volta 2 {
d2.:m | c4.:5 d4.:m | 
d2.:m | c4.:5 d4.:m | 
d2.:m | c4.:5 d4.:m |
}
\time 2/8
\repeat volta 2 {
d4:m | d4:m | c4:5 | c8:5 d8:m | 
d4:m | d4:m | c4:5 | c8:5 d8:m | 
d4:m | d4:m | c4:5 | c8:5 d8:m | 
}
}


voiceA = \relative c' {
\clef "treble"
\key d \minor
\time 6/8
\repeat volta 2 {
\oneVoice
f8 e d f d4 | e8 f e d4. |
g8 f e f d d | e8 f e e d4 |
g8 f e f d d | e8 f e e d4 |
}
\time 2/8
\repeat volta 2 {
\voiceOne
f16 f f f | g16 f e d | c16 c f8 | e16 e d8 
f16 f f f | g16 f e d | c16 c f8 | e16 e d8 
f16 f f f | g16 f e d | c16 c f8 | e16 e d8 
}  
}

voiceB = \relative c' {
\clef "treble"
\key d \minor
\time 6/8
\repeat volta 2 {
s2. | s2. |
s2. | s2. |
s2. | s2. |
}
\time 2/8
\repeat volta 2 {
d16 d d d | e16 d c bes | a16 a d8 | c16 c d8 
d16 d d d | e16 d c bes | a16 a d8 | c16 c d8 
d16 d d d | e16 d c bes | a16 a d8 | c16 c d8 
}  
}



lyricA = \lyricmode {
\set stanza = #"Piedz." Mam -- mi -- ņa mī -- ļā, laid is -- ta -- bā, 
Ne -- zag -- šu jē -- ri -- ņu, ne kaz -- lē -- ni -- ņu, 
Ne -- zag -- šu jē -- ri -- ņu, ne kaz -- lē -- ni -- ņu.

\set stanza = #"1." Či -- gā -- no -- si laiz -- da -- mā -- si, tol -- da -- rō, tol -- da -- rō,
Lī -- dzi ņē -- mu ka -- zas gal -- vu, tol -- da -- rō, tol -- da -- rō,
Lī -- dzi ņē -- mu ka -- zas gal -- vu, tol -- da -- rō, tol -- da -- rō. 
}

lyricB = \lyricmode {
Su -- sek -- li to zag-šu, to va -- ja -- dzēs-
či -- gā -- na bēr -- ni -- ņiem spro -- gai -- nas gal -- vas,
či -- gā -- na bēr -- ni -- ņiem spro -- gai -- nas gal -- vas.

Ja ne -- de -- va ci -- tas ga -- ļas, tol -- da -- rō, tol -- da -- rō,
Grau -- zu sa -- vu ka -- zas gal -- vu, tol -- da -- rō, tol -- da -- rō,  
Grau -- zu sa -- vu ka -- zas gal -- vu, tol -- da -- rō, tol -- da -- rō.  
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
\new Lyrics \lyricsto "voiceA" \lyricB
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


