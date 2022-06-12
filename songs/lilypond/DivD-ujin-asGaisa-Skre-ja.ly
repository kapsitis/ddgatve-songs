\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Div dūjiņas gaisā skrēja",AA lapas, Jāņi
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
\key g \major
\time 4/4
e4 e e4. b8 |
d4 d d4. b8 |
c8[ b] a4 e'4. c8 |
b4 b b2 |
g'2 fis |
g8[ fis] e8[ dis] e4( g) |
d4 d e4. c8 |
b4 b e2 |
\bar "|."
} 

lyricA = \lyricmode {
Div' dū -- ji -- ņas gai -- sā skr -- ēja, a -- bas skrē -- ja dū -- do -- dam's,
ai -- jā, ai -- jai -- jā, a -- bas skrē -- ja dū -- do -- dam's.
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
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


