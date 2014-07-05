\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% Skyforger
% Sidrabiņa upe teka
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \minor
\time 2/4
c8 c c c |
g'8 g g g |
\time 4/4
\slurDashed
f4 f8[ aes] g4.( g8) |
\time 2/4
f8 f f d |
ees ees ees c |
\time 4/4
d4 ees8[ d] c2 |
\bar "|."
}


voiceB = \relative c' {
\clef "treble"
\key c \minor
\time 2/4
c8 c c c |
c8 c c c |
\time 4/4
\slurDashed
bes4 bes ees4.( ees8) |
\time 2/4
d8 d d d |
c8 c c c |
\time 4/4
g4 g c2 |
\bar "|."
}


lyricA = \lyricmode {
Si -- dra -- bi -- ņa u -- pe te -- ka, u -- pe tek, 
vis -- ga -- rā -- mi zel -- ta ka -- lnu, zel -- ta kaln',
}




fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\lyricsto "voiceB" \new Lyrics \lyricA
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


