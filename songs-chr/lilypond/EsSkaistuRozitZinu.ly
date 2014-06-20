\version "2.13.16"
%\header {
%    title = "Es skaistu rozīt' zinu"
%}
#(set-global-staff-size 16)
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
\time 4/4
\partial 2*1
c'2 | c4 c d c |
\time 6/4
c2 a bes | a4 g 2 f e 4 |
\time 4/4
f2 c' | c4 c d c |
\time 6/4
c2 a bes | a4 g2 f e4 |
\time 4/4
f2 r4 a | g4 e f d |
c2. c' 4 | c4 c d c |
\time 6/4
c2 a bes | a4 g2 f e4 |
f1
\bar "|."
}

voiceB = \relative c' {
\time 4/4
\partial 2*1
a'2 | a4 f f f |
\time 6/4
e2 d d | c2 d4 a c2 |
\time 4/4
c2 a' | a4 f f f |
\time 6/4
e2 d d | c2 d4 a c2 |
\time 4/4
c2 r4 f | d4 c c b |
c2. e4 | g4 f f f |
\time 6/4
e2 d d | f4 d e f c2 |
c1
\bar "|."
}

voiceC = {
\clef "bass"
\key f \major
\time 4/4
\partial 2*1
c'2 | c'4 a bes a |
\time 6/4
g2 f f | a4 c' bes a2 g4 |
\time 4/4
a2 c' | c'4 a bes a |
\time 6/4
g2 f f | a4 c' bes a2 g4 |
\time 4/4
a2 r4 c' | bes4 a a g |
e8 f g2 g4 | g4 a bes a |
\time 6/4
g2 fis g | c'4 bes a2 g2 |
a1
\bar "|."
}

voiceD = {
\partial 2*1 
f2 | f4 f bes f |
\time 6/4
c2 d bes, | f4 e d2 c2 |
\time 4/4
f2 f | f4 f bes f |
\time 6/4
c2 d bes, | f4 e d2 c2 |
\time 4/4
f2 r4 f | g4 a f g |
c8 d e2 c4 | e4 f bes, f |
\time 6/4
c2 d g, | a,4 bes, c2 c2 |
f 1
\bar "|."
}

lyricA = \lyricmode {
Es skai -- stu ro -- zīt' zi -- nu, 
No sī -- kas sak -- nī -- tes; 
Tā ro -- zī -- te, ko mi -- nu, 
No Je -- ses cē -- lu -- sies.
Tā plau -- ka dzes -- tru -- mā 
Pie auk -- stas zie -- mas sau -- les, 
Pie pus -- nakts tum -- sī -- bā.
}


fullScore = <<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new PianoStaff 
<<
\new Staff = "upper" {<<
\new Voice = "voiceA" { \voiceOne \voiceA }
\new Voice = "voiceB" { \voiceTwo \voiceB }
>>}
\new Staff = "lower" {<<
\new Voice = "voiceC" { \voiceThree \voiceC }
\new Voice = "voiceD" { \voiceFour \voiceD }
>>}
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


