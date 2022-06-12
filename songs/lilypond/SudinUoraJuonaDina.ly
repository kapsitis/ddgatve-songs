\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Šudiņ uorā Juoņa dīna"
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

voiceA = \transpose d a { \relative c' {
\clef "treble"
\key d \minor
\time 2/4
d8 f d f | a8 g f g \time 3/4
f8 e d2 | d8 f a2
\time 2/4
g8 g g g | a8 g f g \time 3/4
f8 e d2
\bar "|."
} }

lyricA = \lyricmode {
Šu -- diņ uo -- rā Juo -- ņa dī -- na, le -- je -- gō, le -- je -- gō!
Šu -- diņ uo -- rā Juo -- ņa dī -- na, le -- je -- gō!
} 


voiceB = \transpose d a { \relative c' {
\clef "treble"
\key d \minor
d8 f d f | a8 g f g \time 3/4
f8 e d2 | d8 f f2
\time 2/4
e8 e e e | f8 e f g \time 3/4
d8 e d2
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


