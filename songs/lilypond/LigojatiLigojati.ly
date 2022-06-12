\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Līgojati, līgojati"
%}
% a.k.a. "Kas Jānīti ielīgoja"
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
\repeat volta 2 {
\time 6/8
ees4^"diezgan ātri" ees8 ees8[ bes]  ees | g4 g8 g[ ees] g |
g8[ ees] g g[ ees] g | bes4. bes \time 9/8 
f4( aes8) g2.
}
% \bar "|."
}
}

lyricA = \lyricmode {
Lī -- go -- ja -- ti, lī -- go -- ja -- ti, 
lī -- go, lī -- go, lī -- go, Jā -- nīt!
}

lyricB = \lyricmode {
Nav vairs tā -- lu Jā -- ņa die -- na,
lī -- go, lī -- go, lī -- go, Jā -- nīt!
}

voiceB = \transpose ees c { \relative c' {
\clef "treble"
\key ees \major
\repeat volta 2 {
\time 6/8
bes4 bes8 bes4 bes8 | ees4 ees8 ees[ bes] ees |
ees8[ bes] ees ees[ bes] ees | g4. g \time 9/8 
d4( f8) ees2.
}
}
}

chordsA = \chordmode {
\time 6/8 
c2.:5 | c2.:5 | c2.:5 | g2.:5 |
\time 9/8 
g4.:5 c2.:5
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


