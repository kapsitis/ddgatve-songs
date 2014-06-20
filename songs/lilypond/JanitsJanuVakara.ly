\version "2.13.16"
%\header {
%    title = "Jānīts jāņu vakarā"
%}
% "Visi gaida jāņu dienu", 213.lpp.
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.3\cm
between-system-space = 0.3\cm
}
\layout {
indent = #0
ragged-last = ##f
}

voiceA = \transpose f c { \relative c' {
\clef "treble"
\key f \major
\time 2/4 a'8 g f c 
\time 3/4 f8 g bes4 a 
\time 2/4 a8 f a g
\time 3/4 g8 e f2 
\time 2/4 c8 c bes' bes | a8 g f c 
\time 3/4 f8[ g] a2 | g4 f2 
\time 2/4 c8 c bes' bes | a8 g f c 
\time 3/4 f8[ g] a2 | g4 f2
\bar "|." 
} }


lyricA = \lyricmode {
Jā -- nīts Jā -- ņu va -- ka -- rā -- i
Jā -- ņu bēr -- nus sa -- tau -- rēj'; 
kad pa -- gā -- ja Jā -- ņu die -- na, 
lī -- go, lī -- go, 
ar bun -- gā -- mi aiz -- rai -- dī -- ja, lī -- go, lī -- go!
}


voiceB = \transpose f c { \relative c' {
\clef "treble"
\key f \major
\time 2/4 s2 
\time 3/4 s2. 
\time 2/4 s2
\time 3/4 s2. 
\time 2/4 c8 c g' g | f8 e d c 
\time 3/4 d8[ e] f2 | g4 f2 
\time 2/4 c8 c g' g | f8 e d c 
\time 3/4 d8[ e] f2 | g4 f2
\bar "|." 
} }

chordsA = \chordmode {
\time 2/4
c2:5 | 
\time 3/4
c4:5 f4:5 c4:5 | 
\time 2/4
c2:5 | 
\time 3/4
g4:5 c2:5 |
\time 2/4
g4:5 f4:5 |
c2:5 |
\time 3/4
c2.:5 | g4:5 c2:5 |
\time 2/4
g4:5 f4:5 |
c2:5 |
\time 3/4
c2.:5 | g4:5 c2:5 |
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
