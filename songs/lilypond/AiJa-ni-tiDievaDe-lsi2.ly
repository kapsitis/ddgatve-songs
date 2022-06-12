\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ai, Jānīti, Dieva dēlsi"
%}
% Katrīna Riekstiņa, #52 (Iļģi)
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
\key d \minor
\time 4/4
\repeat volta 2 {
f8 e d d f e d d | a'4 d, a' d, | a'8 a g e f f e g | d4 d d d 
}
} 




lyricA = \lyricmode {
Ai, Jā -- nī -- ti, Die -- va dēl -- si, lī -- go, lī -- go, 
Ta -- vu pla -- tu ce -- pu -- rī -- ti, lī -- go, lī -- go.   
}

chordsA = \chordmode {
\time 4/4
d1:m | d1:m | d2:m a2:m | d1:m
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



