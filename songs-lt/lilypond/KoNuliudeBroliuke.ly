\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ko nuliūdε, broliukε"
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
\key g \major
\time 2/4
g'8 g b b | a4 a8 c | b8 b b b | a4 a8 g |
\repeat volta 2 {
b8 b d d | c4 d | b8 b a g | a2
}
}

lyricA = \lyricmode {
Ko nu -- liū -- dε, bro -- liu -- kε,
Ko nu -- liū -- dε, jau -- na -- sε,
Kam nu -- lai -- dε balts ronks ont sa -- va ke -- lal(ių)?
}

voiceB = \relative c' {
\clef "treble"
\key g \major
\time 2/4
g'8 g g g | d4 d8 a'8 | g8 g g g | d4 d8 d
\repeat volta 2 {
g8 g <<g b>> <<g b>> | a4 a | g8 g fis e | d2
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
