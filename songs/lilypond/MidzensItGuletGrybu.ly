\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Mīdzeņš īt(i), gulēt grybu"
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
f8 f a a | f8 f a a | c8 c bes8. a16 | a8 g g4
c,8 e g g | c,8 e g g | d'8 d c8. bes16 | bes8 a a4
\bar "\."
} 

lyricA = \lyricmode {
Mī -- dzeņš ī -- ti, gu -- lēt gry -- bu,
Na -- laiž ma -- ni muo -- mu -- leņ’.
Mī -- dzeņš ī -- ti, gu -- lēt gry -- bu,
Na -- laiž ma -- ni muo -- mu -- leņ’.
} 


voiceB = \relative c' {
\clef "treble"
\key f \major
\time 2/4
f8 f a a | f8 f a a | a8 a g8. f16 | f8 e e4
c8 e g g | c,8 e g g | bes8 bes a8. g16 | g8 f f4
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


