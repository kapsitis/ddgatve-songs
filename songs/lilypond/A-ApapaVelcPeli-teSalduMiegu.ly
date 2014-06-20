\version "2.13.16"
%\header {
%    title = "Ā apapā, velc pelīte saldu miegu"
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
g'8( e g e) | g8 e g r | g8 e g e | g8 f f e |
g8( e g e) | g8 e g r | g8 f f e | f8 f e4 |
\bar "|."
} 

lyricA = \lyricmode {
Ā a -- pa -- pa, velc pe -- lī -- te sal -- du mie -- gu,
Ā a -- pa -- pa, ma -- ģa -- ja -- me bēr -- ni -- ņam. 

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


