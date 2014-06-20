\version "2.13.16"
%\header {
%    title = "Divi sirmi kumeliņi aiz aploka spēlējās",AA lapas
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
c8 f f f |
g8 c, c c |
bes8 d d d |
d8 c c4 |
a8 c c c |
c8 f f4 |
e8 g g a16[ g] |
f8 f f4
\bar "|."
} 

lyricA = \lyricmode {
Di -- vi sir -- mi ku -- me -- li -- ņi aiz ap -- lo -- ka spē -- lē -- jās, 
ai -- jā ai -- jā ai -- ja -- jā, aiz ap -- lo -- ka spē -- lē -- jās 
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

