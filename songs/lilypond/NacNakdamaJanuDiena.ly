\version "2.13.16"
%\header {
%    title = "Nāc nākdama, Jāņu diena"
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


voiceA = \transpose c a  { \relative c' {
\clef "treble"
\key c \minor
\time 6/8
c4^"mēreni" c8 g'4 f8 | g4 ees8 d4 c8 |
ees4. d4. | ees4. g4. | f4 f8 f4 f8 |
g4 ees8 d4 c8 | ees4. d4. | ees4. g4. |
f4 f8 f4 f8 | g4 ees8 d4 c8 \time 12/8 
ees4.( d4.) c2. 
\bar "|."
}}

lyricA = \lyricmode {
Nāc nāk -- da -- ma, Jā -- ņu die -- na, lī -- go, lī -- go, 
te -- vi gai -- da lie -- li, ma -- zi, lī -- go, lī -- go, 
te -- vi gai -- da lie -- li, ma -- zi, lī -- go. 
}

voiceB = \transpose c a { \relative c' {
\clef "treble"
\key c \minor
\time 6/8
c4 c8 g'4 f8 | g4 ees8 d4 c8 |
c4. b4. | c4. ees4. | d4 d8 d4 d8 |
ees4 c8 b4 g8 | c4. b4. | c4. ees4. |
d4 d8 d4 d8 | ees4 c8 b4 c8 \time 12/8 
g4. b4. c2.
}}

chordsA = \chordmode {
\time 6/8 
a2.:m | a2.:m | g2.:5 | a2.:m | g2.:5 |
a2.:m | g2.:5 | a2.:m | g2.:5 | a2.:m |
\time 12/8
g2.:5 a2.:m
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


