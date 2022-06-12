\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Avotā guni kūru"
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


voiceA = \transpose b a' { \relative c' {
\clef "treble"
\key b \minor
\time 6/4
\repeat volta 2 {
b8 cis d[ cis] b4 e8 fis g4 fis g8 fis e4 d8[ e] d cis b2
}
} }

lyricA = \lyricmode {
A -- vo -- tā -- i gu -- ni kū -- ru, caur ak -- me -- ni dū -- mi kūp. 
}

chordsA = \chordmode {
\time 6/4
a2.:m g2.:5 | a2:m g2:5 a2:m |
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


