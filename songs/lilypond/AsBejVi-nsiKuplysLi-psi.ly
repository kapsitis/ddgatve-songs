\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "As bej' vīnsi kuplys līpsi ",Laivas lapas,Ziemassvētki
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

chordsA = \chordmode {
\time 2/4
\partial 8*1
s8 | c2:5 | f2:5 | c2:5 | f2:5 | f2:5 | c2:5 | c2:5
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\partial 8*1
e8 |
%MS
e8 e f e |
f8 d e c |
d8 c c4 |
%ME
f8 \times 2/3 { e16[ f e] } d8[ e] |
f8 e d e |
f8 d c e |
d8 c c4 |
\bar "|."
}

lyricA = \lyricmode {
 A as bej' vīn -- si kup -- lys līp -- s(i), ka -- la -- dō, ka -- la -- dō, as bej' vīn -- si kup -- lys līp -- s(i), ka -- la -- dō!
} 

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
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


