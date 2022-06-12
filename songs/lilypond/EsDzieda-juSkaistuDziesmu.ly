\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Es dziedāju skaistu dziesmu",AA lapas, Jāņi
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
c8 g' g g |
g8 e c c |
\time 4/4 
a'4 g8[ e] g2 |
\time 2/4
e8 g g g |
g8 e f g16[ f] |
\time 4/4 
e4 d c2 |
\time 2/4
g'8 g a b |
c8 a g f |
\time 4/4 
e4 d c2 |
\bar "|."
} 


voiceB  = \relative c' {
s2 s2 s1 s2 s2 s1 s2 s2 
\time 4/4
e8[ d] g[ f] e2 |
} 


lyricA = \lyricmode {
Es dzie -- dā -- ju skais -- tu dzies -- mu, lī -- go -- jam! Pie vār -- tie -- mi pie -- ie -- da -- ma, lī -- go -- jam;
pie vār -- tie -- mi pie -- ie -- da -- ma, lī -- go -- jam!
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


