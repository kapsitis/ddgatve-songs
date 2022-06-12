\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ai, Jānīti, Dieva dēls"
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
f8 e d d | f8 e d d | a'4 d, | a'4 d, |
a'8 a g e | f f e g | d4 d 
\bar "|."
} }

lyricA = \lyricmode {
Ai, Jā -- nī -- ti, Die -- va dēl -- si, lī -- go, lī -- go, 
ta -- vu pla -- tu ce -- pu -- rī -- ti, lī -- go!
}

voiceB = \transpose d a {\relative c' {
\clef "treble"
\key d \minor
\time 2/4
f8 e d d | f8 e d d | d4 d | d4 d |
f8 f e c | d d c e | d4 d 
\bar "|."
} }

chordsA = \chordmode {
\time 2/4
a2:m | a2:m | a2:m | a2:m | a2:m |
g2:5 | a2:m |
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


