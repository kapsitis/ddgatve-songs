\version "2.13.16"
%\header {
%    title = "Jauni puiši jaunas meitas",AA lapas, Jāņi
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
e8 g f e |
g8 f e c |
e4 f |
e4 f |
e8 g f e |
g8 f e c |
e4 f |
e4 f |
\bar "|."
} 

lyricA = \lyricmode {
Jau -- ni pui -- ši jau -- nas mei -- tas, lī -- go, lī -- go, nav vairs tā -- lu Jā -- ņu die -- na, lī -- go, lī -- go.
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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


