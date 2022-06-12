\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Rūtoj saule"
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


voiceA = \transpose d c { \relative c'' {
\clef "treble"
\key d \major
\time 2/4
a8 g a16[ g] fis8 | e16[ fis] g8 e g 
\time 3/4
fis4 g2 | fis4 e2 
\time 2/4
a8 g a g16[ fis] | e16[ fis] g8 e g 
\time 3/4
fis4 g2 | fis4 e2
\bar "|."
} }

lyricA = \lyricmode {
Rū -- toj sau -- le, rū -- toj mē -- ness, rū -- tō, rū -- tō, 
rū -- toj vy -- sa va -- sa -- re -- ņa, rū -- tō, rū -- tō.
}

voiceB = \transpose d c { \relative c' {
\clef "treble"
\key d \major
\time 2/4
d8 e d d | e8 e e e 
\time 3/4
\times 2/3 { d8[ cis d] } e2 | d4 e2 
\time 2/4
d8 e d d | e8 e e e 
\time 3/4
\times 2/3 { d8[ cis d] }  e2 | d4 e2
} }


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


