\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% AALapas
% Ik vakaru dziedāt gāju 
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key d \major
\time 2/4
e8. e16 e8. d16 |
d8 fis  fis e16[ fis] |
g8 g g16[ fis] g8 |
a8 fis fis16[ e] fis8 |
e4 g8 fis16 e |
fis8 fis fis4 |
g4 e |
fis2\fermata |
\bar "|."
}


voiceB = \relative c' {
\clef "treble"
\key d \major
\time 2/4
e8. e16 e8. d16 |
d8 d d d |
e8 e e e |
d8 d d16[ cis] b8 |
a4 a8 a16 a |
d8 d d4 |
e4 a, |
d2\fermata |
\bar "|."
}


lyricA = \lyricmode {
Ik va -- ka -- ru dzie -- dāt gā -- ju sid -- ra -- bi -- ņa kal -- ni -- ņā -- i,
rai -- rī -- ri -- di ral -- lal -- lā, ral -- lal -- lā!
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceB" \lyricA
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


