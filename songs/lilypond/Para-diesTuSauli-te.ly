\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Parādiesi tu, saulīte"
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

voiceA = \relative c' {
\clef "treble"
\key b \minor
\time 4/4
b8 b e cis d b cis cis | b b e cis d b cis4 |
d8 b b cis d d cis cis 
d8 b b cis d d cis4
d8 b b cis d d cis4\fermata
}

voiceB = \relative c' {
\clef "treble"
\key b \minor
\time 4/4
s1 | s1 |
b8 b b b b b a a 
b8 b b b b b a4
b8 b b b b b a4\fermata
}


lyricA = \lyricmode {
Pa -- rā -- die -- si, tu, sau -- lī -- te, 
Trīs -- reiz je -- le die -- ni -- ņā,
Pa -- rā -- die -- si, tu, sau -- lī -- te, 
Trīs -- reiz je -- le die -- ni -- ņā, 
Trīs -- reiz je -- le die -- ni -- ņā.
} 

fullScore = <<
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


