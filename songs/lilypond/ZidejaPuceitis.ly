\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Zīdēja pučeitis"
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

voiceA = \relative c'' {
\clef "treble"
\key f \major
\time 2/4
\repeat volta 2 {
bes4 bes8 bes | bes4 a8 g | a4 a8 a | a4 g8 f |
g8 f e d | c4 d8 e | f4 a8 g | f2
}
\repeat volta 2 {
d'4 d8 d | d2 | c8[ bes] a bes | c2 |
g8[ f] e d | c4 d8 e | f4 a8 g | f2
}
} 

lyricA = \lyricmode {
Zī -- dē -- ja pu -- čei -- tis, zī -- dē -- ja rū -- zei -- tis,
Mu -- na skais -- tuo jau -- nei -- ba na -- zī -- dēs vairs.
Jau ma -- ni vad, jau ma -- ni vad,
Jau mu -- na jau -- nei -- ba kiu -- li -- ņus mat.
} 


voiceB = \relative c'' {
\clef "treble"
\key f \major
\time 2/4
\repeat volta 2 {
s2 | s2 | s2 | s2 | 
s2 | s2 | s2 | s2 
}
\repeat volta 2 {
bes4 bes8 bes | bes2 | a8[ g] f g | a2 |
s2 | s2 | s2 | s2 
}
} 


fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


