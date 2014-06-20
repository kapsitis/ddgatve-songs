\version "2.13.16"
%\header {
%    title = "Monsoon, We Welcome You"
%} 
% Words: Yasmin; Music: Hema
% Monsoon Janmashtami Song Book. Sloka, The Hederabad Waldorf School
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
\time 3/4
e'4 c c | d4. d8 d4\fermata | c4. b8 c4 | g4 a b | c2 e4 | c4 d d | c2 c4
\repeat volta 2 {
c4. b8 c4 | g4 a b | c2 r4 
} 
\repeat volta 2 {
a4 g e | e4 a g | e2 r4
}
c'8 c b c4. | g4 a b | b4 c2
\bar "|."
} 

lyricA = \lyricmode {
Mon -- soon, we wel -- come you!
Pea -- cocks dance and cu -- ckoos sing!
Wel -- come! Wel -- come Mon -- soon!
Na -- ture's thirst is quenched a -- gain,
Far -- mer's face is bright a -- gain,
Grate -- ful are we to see you a -- gain!
}

lyricB = \lyricmode {
_ _ _ _ _ _
_ _ _ _ _ _ _
_ _ _ _ _ _ 
All the leaves turn green a -- gain. 
Chil -- dren spla -- shing in the rain. 
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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



