\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Leigojiti Juoņu nakti"
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

voiceA = \transpose g c' { \relative c'' {
\clef "treble"
\key g \major
\numericTimeSignature
\time 3/4
a4. a8 a a \time 2/4
a8 g fis e \time 4/4
d4 b'2. \time 2/4
b8 b a b | c8 b a4 
\time 4/4
a8. g16 fis8 e d2
\bar "|."
} }



lyricA = \lyricmode {
Lei -- go -- ji -- ti Juo -- ņu nak -- ti, lei -- gū, 
kai Juo -- nei -- ša ca -- pu -- reit trā -- di -- ral -- lal -- lā!
}

chordsA = \chordmode {
\time 3/4
g2.:5 | 
\time 2/4
g2:5 |
\time 4/4
g4:5 c2.:5 |
\time 2/4
c2:5 | f4:5 g4:5 | 
\time 4/4
g1:5
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


