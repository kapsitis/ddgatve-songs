\version "2.13.16"
%\header {
%    title = "Nosarūca lāču māte",AA lapas, Šūpuļdziesmas
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
\key e \major
\time 2/4
e8 b b e | 
\time 3/4
cis16[ b] a8 b4. b8 |
\time 2/4
e8 b b e | 
\time 3/4
cis16[ b] a8 b2 |
b8 b fis' fis fis16[ gis] fis8 |
e4.( dis16 cis16) b4 |
b8 b gis'16[ fis] gis8 fis fis |
\time 2/4
e2
\bar "|."
} 

lyricA = \lyricmode {
Es re -- dzē -- ju jū -- ri -- ņā -- i zel -- ta stel -- les lī -- go -- jam; 
Es re -- dzē -- ju jū -- ri -- ņā -- i zel -- ta stel -- les lī -- go -- jam.
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


