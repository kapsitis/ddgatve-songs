\version "2.13.16" 
%\header {
%    title = "Ganins biju, gonūs guoju"
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
\clef treble 
\key c \minor
\time 4/4 
bes8 bes bes bes g' g g g | f4 f8[ aes] g4. g8 |
f8 f f f ees ees ees ees | d4 ees8[ d] c2
\bar "|."
} 

voiceB = \relative c' {
\clef treble 
\key c \minor
\time 4/4 
s1 | s1 |
s4. d8 s2 | s1
} 



lyricA = \lyricmode {
Ga -- nins bi -- ju go -- nūs guo -- ju, go -- nūs guo -- ju, 
Go -- na drie -- bes mu -- ga -- rā -- i, mu -- ga -- rā.
}


voiceC = \relative c' {
\clef treble 
\key c \minor
\time 4/4 
bes8 bes bes bes ees ees ees ees | d4 d\glissando ees4. ees8 |
d8 d d d c c c c | g4 c8[ b] c2
\bar "|."
} 

voiceD = \relative c' {
\clef treble 
\key c \minor
\time 4/4 
s1 | bes4 bes8[ ees] s2 | 
s4. bes8 s2 | s1
}



fullScore = <<
\new StaffGroup <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\lyricsto "voiceA" \new Lyrics \lyricA
>>
}
\new Staff {
<<
\new Voice = "voiceC" { \voiceOne \autoBeamOff \voiceC }
\new Voice = "voiceD" { \voiceTwo \autoBeamOff \voiceD }
>>
}
>>
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


