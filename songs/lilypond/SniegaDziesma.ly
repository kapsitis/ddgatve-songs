\version "2.13.16" 
%\header {
% title = "Sniega dziesma"
%}
% Dzeltenā mape, p.3
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.3\cm
between-system-space = 0.3\cm
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
f8[ d f d] f[ d a' g] | f8[ d f d] f[ d a' g] | 
f8[ c f c] f[ c a' g] | f8[ c f c] f[ c a' g] 
}
\repeat volta 2 {
\time 2/4
f8 e d d 
\time 3/4
g8 f e[ d] c4 
}
\time 2/4
f8 f e f16[ e] | d8 d d e | 
f8 f e f16[ e] | d8 d d e
\bar "|." 
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 4/4
\phrasingSlurDashed
c4 c8 c e c c4 | d8 g, g4 e'8 c c4 | c4 c8 c e c c\( c\) | d8 g, g g c4 s4
\bar "|." 
}


lyricA = \lyricmode {
_ _ _ _ _ _ _ _
Snie -- dzi, snie -- dzi, bal -- tais snie -- dziņ!
Ap -- klāj ze -- mes mel -- nu -- mi -- ņu! 
Ap -- klāj ze -- mes mel -- nu -- mi -- ņu! 
}


chordsA = \chordmode {
\time 4/4
\repeat volta 2 {
d1:m s1 f1:5 s1
}
\repeat volta 2 {
\time 2/4
d2:m
\time 3/4
c2.:5
}
\time 2/4
d4:m c4:5 | d2:m | f4:5 c4:5 | d2:m
}


fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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


