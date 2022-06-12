\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Lēni, lēni Dieviņš brauca"
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


voiceA = {
\clef "treble"
\key d \minor
\time 2/4
d'8 e' d' e' | e'8 e' f' d' |
f'8 e' d' f' | e'8 e' f' e' |
f'8 a' f' a' | g'8 f' a' g' |
a'4 f' | e'2 | e'2
\bar "|."
} 

lyricA = \lyricmode {
Lē -- ni, lē -- ni Die -- viņš brau -- ca
No kal -- ni -- ņa le -- ji -- ņā -- i,
No kal -- ni -- ņa le -- ji -- ņā -- i, le -- ji -- ņā.
}

voiceB = {
\clef "treble"
\key d \minor
\time 2/4
s2 | s2 | s2 | s2 |
d'8 f' d' f' | e'8 d' f' e' |
f'4 d' | e'2~ | e'2
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA"  { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Voice = "voiceB"  { \voiceTwo \autoBeamOff \voiceB }
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


