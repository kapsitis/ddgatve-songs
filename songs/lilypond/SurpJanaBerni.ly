\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Šurp, Jāņa bērni"
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
\key c \major
\time 2/4
c4 e8 f | g4 c | g4 f8 d | a'8 g e4
c4 e8 f | g4 c | g4 f8 d | a'8 g c,4
\repeat volta 2 {
g'8. e16 f8 f | e8 e d d | 
g8 e f8 f | e8 e d4
}
} 



lyricAA = \lyricmode {
Šurp, Jā -- ņa bēr -- ni, dzie -- dā -- sim tī -- ru -- mā, 
dzie -- dā -- sim ska -- ņi līdz vē -- lam va -- ka -- ram!
Pē -- te -- rī -- tis, Mi -- ķe -- lī -- tis, 
a -- bi gā -- ja be -- kas lauzt, 
}

lyricAB = \lyricmode {
_ _ _ _ _ _ _ _ 
_ _ _ _ _ _ _ _ 
_ _ _ _ _ _ a -- bi di -- vi pie -- ku -- su -- ši, 
ne -- var be -- kas kus -- ti -- nāt.
}

chordsA = \chordmode {
\time 2/4
c2:5 | c2:5 | g2:5 | g4:5 c4:5 | c2:5 | c2:5 | g2:5 | g4:5 c4:5 
\repeat volta 2 {
c2:5 | c2:5 | c2:5 | c2:5 |
}
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricAA
\new Lyrics \lyricsto "voiceA" \lyricAB
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



