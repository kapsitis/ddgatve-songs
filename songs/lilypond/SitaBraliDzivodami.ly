\version "2.13.16"
%\header {
%    title = "Šitā, brāļi, dzīvodami"
%}
% Budēlīši, p.104
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
\time 3/4 c'4. g16[ aes] bes8 g 
\time 2/4 f8 f g d | ees8 f g ees | d8 d c4 |
c'4 d | ees8 ees d4 | c8 bes16[ aes]  g4   
\bar "|." 
} 

lyricA = \lyricmode {
Ši -- tā, brā -- ļi dzī -- vo -- da -- mi, ne -- zi -- ņā -- i aiz -- ie -- sim, 
ē, ē, ai -- jai -- jā, aiz -- ie -- sim!
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


