\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Jānīts jāja gadapkārtu",AA lapas, Jāņi
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
\key a \major
\time 2/4
fis8 e cis e |
e8 b cis a |
fis'8 e cis e |
e8 b cis b |
\time 3/4
a4 e'2 |
d8[b ] cis2 |
b4 a2 |
\bar "|."
} 

lyricA = \lyricmode {
Jā -- nīts jā -- ja gad -- ap -- kār -- tu, at -- jāj Jā -- ņu va -- ka -- rā -- i, lī -- gā, lī -- gā, lī -- gā!
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


