\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Noiet saule vakarāi",AA lapas, Saule
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
\key d \major
\time 2/4
a8 d cis e |
d8 d a a |
fis'4 e8 g |
fis2 |
e8 d fis e |
d8 d a a |
d4 cis8 e |
d2
\bar "|."
} 

lyricA = \lyricmode {
No -- iet Sau -- le va -- ka -- rā -- i,
 ai, va -- ka -- rā, me -- ža ga -- lus puš -- ķo -- jo -- ti, ai puš -- ķo -- jot.
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


