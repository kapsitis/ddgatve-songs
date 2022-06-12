\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Cīrulīti mazputniņi",karavīru
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
\key c \minor
\time 2/4
c8 c c8. bes16 |
c8 c d d |
ees16[ d] c8 bes8 d |
c8 c c4 |
\repeat volta 2 {
\time 3/4
ees8( f g4) g |
f8 g ees d c4 |
}
} 

lyricA = \lyricmode {
Cī -- ru -- lī -- ti, maz -- put -- ni -- ņi, ne -- gul ce -- ļa ma -- li -- ņā,
ne -- gul ce -- ļa ma -- li -- ņā.
} 

fullScore = <<
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


