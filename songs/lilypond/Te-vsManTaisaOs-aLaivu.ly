\version "2.13.16"
%\header {
%    title = "Tēvs man taisa oša laivu",Budēlīši, jūra
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
\key g \major
\time 4/4
b'4. g8 b4 b |
a4. fis8 d4 d |
a'4. g16[ a] b8[ a] b4 |
a4. g16[ fis] d4 d |
a'4 a a8[ b] c4 |
b4. a8 g2 |
a8[ g] fis[ g] a[ b] c4 |
\time 5/4 
b4.( a8) \times 2/3 {g8[ a b]} g2 |
\bar "|."
}

lyricA = \lyricmode {
Tēvs man tai -- sa o -- ša lai -- vu, tēvs man tai -- sa o -- ša lai -- vu 
zel -- tī -- tie -- mi ai -- rī -- šiem, zel -- tī -- tie -- mi ai -- rī -- šiem.
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


