\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.27
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4
\oneVoice
c'4 d d c | a c a b | a c b c |
c b8 [a] \voiceOne a2 | d4 c a c | c b8 [a] a2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Tol -- ka le -- la, tol -- ka mo -- za, tol -- ka bā -- du pa -- da -- rēj,
tol -- ka bā -- du pa -- da -- rēj. 
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 4/4
s1 | s | s | s2 a' ( | a1 )( | a)
}

lyricB = \lyricmode {
Ē-
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceB" \lyricB
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


