\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Vuo kad aš juojau"
%}
% "Skamba, skamba kankliai, 1993"
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
\key c \major
\time 4/4
\repeat volta 2 {
d'8.[( c16]) b8 a g4( e'8) e | d8 d e c d2
}
\repeat volta 2 {
d8. c16 b8 d c4( b8) a8 | b8 b b c d4( e8) e8 | d8 d e c d2
}
}

lyricA = \lyricmode {
Vuo kad aš juo -- jau par ža -- li gi -- ri,
Par ža -- li gi -- re -- li, par ža -- li gi -- re -- li,
Pruo pu -- šy -- ne -- li.
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 4/4
\repeat volta 2 {
g'8.[( g16]) g8 d g4( c8) c | <<g8 b>> <<g b>> c8 a <<g2 b>>
}
\repeat volta 2 {
b8. a16 g8 <<g b>> a4( g8) d8 | g8 g g a <<g4 b(>> c8) c | <<g8 b>> <<g b>> c8 a <<g2 b>>
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
