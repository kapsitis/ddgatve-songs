\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Juoņa dīna svāta dīna"
%}
% Katrīna Riekstiņa, #40 (Grodi)
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
\time 2/4
e8 f16[ e] d8 c | f e d c | d8[ f] e4\fermata | d4 c\fermata
\bar "|."
} 

lyricA = \lyricmode {
Juo -- ņa dī -- na svā -- ta dī -- na, rū -- to, rū -- to. 
}

chordsA = \chordmode {
\time 2/4
c2:5 | g2:5 | g4:5 c4:5 | g4:5 c4:5
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



