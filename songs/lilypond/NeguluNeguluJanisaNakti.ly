\version "2.13.16"
%\header {
%    title = "Negulu, negulu Jānīša nakti"
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


voiceA = \transpose ees c { \relative c' {
\clef "treble"
\key ees \major
\time 3/8
ees8 ees ees | aes8 g g | g8 f f | ees4 bes8 \time 6/8
ees4. g4. | f4. ees4. \time 3/8
ees8 ees ees | aes8 g g | g8 f4 | ees4 bes8 \time 6/8
ees4. g4. | f4. ees4. 
\bar "|."
} }

voiceB = \transpose ees c { \relative c' {
\clef "treble"
\key ees \major
\time 3/8
s4.*4 
\time 6/8
s2.*2 
\time 3/8
g'8 g g | c8 bes bes | bes8 aes4 | g4 ees8 
\time 6/8
g4. bes4. | aes8 bes aes g4. 
\bar "|."
} }

lyricA = \lyricmode {
Ne -- gu -- lu, ne -- gu -- lu, Jā -- nī -- ša  nak -- ti, 
lī -- go, lī -- go, 
lai ma -- ni ru -- dzī -- ši vel -- drē ne -- krīt, lī -- go, lī -- go!
}

chordsA = \chordmode {
\time 3/8
c4.:5 | c4.:5 | c4.:5 | c4.:5 | 
\time 6/8
c2.:5 | g4.:5 c4.:5 | 
\time 3/8
c4.:5 | c4.:5 | c4.:5 | c4.:5 | 
\time 6/8
c2.:5 | g4.:5 c4.:5 | 
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \voiceTwo \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\new Voice = "voiceB" { \voiceOne \autoBeamOff \voiceB }
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



