\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Tricēj' kolni, skanēj' meži"
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
\key f \major
\time 2/4
c8 f f g | f e d c | a'4 a8[( c\fermata]) |
bes8 a g f | d8 f f f \time 4/4
a8[ g f] e f2\fermata
\bar "|."
} 

lyricA = \lyricmode {
Tri -- cēj’ kol -- ni, ska -- nēj’ me -- ži,
ai -- jā, ska -- nēj’ me -- ži,
Kod dzī -- duo -- ju, ga -- vi -- liej’.
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



