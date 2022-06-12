\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Maza, maza man' mājiņa", AA lapas, Jāņi
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
\key c \major
\time 2/4
c8 d e e | f e d c | c e e e | f e d c |
\time 3/4
c8[ d] e2 | d4 c2 |
\time 2/4
d8 d e d | d c c4 
\bar "|."
} 

lyricA = \lyricmode {
Ma -- za, ma -- za man'  mā -- ji -- ņa, 
div -- tre -- jā -- di va -- ra vār -- ti, 
lī -- go, lī -- go, 
div -- tre -- jā -- di va -- ra vārt'.
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


