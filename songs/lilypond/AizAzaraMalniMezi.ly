\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Aiz azara malni meži"
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
\key g \major
\time 6/8
g4 g8 g[ fis] g | a4 fis8 d4 d8 | a'4 a8 a8[ g] fis | g4 g8 g4. |
c4 c8 c[ b] a | b4 b8 b[ a] g | a4 a8 a[ g] fis | g4 g8 g4.
\bar "|."
} 

lyricA = \lyricmode {
Aiz a -- za -- ra mal -- ni me -- ži, Bol -- ti zī -- de -- ni zī -- diej',
Puor -- cel ma -- ni, buo -- le -- le -- ni, Lai es ve -- ju vai -- ņu -- ceņ'.
} 


voiceB = \relative c' {
\clef "treble"
\key g \major
\time 6/8
s2. | s2. | fis4 fis8 fis8[ e] fis | g4 g8 g4. |
a4 a8 a[ g] fis | g4 g8 g[ fis] e | d4 d8 d4 d8 | d4 d8 d4.
\bar "|."
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


