\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Visi ciema kukainīši"
%}
% Austras dziesmu burtnīca, 32.lpp.
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
\key d \minor
\time 2/4
d8 d d e | f8 f f d | e8 e e cis | d8 d d4 |
a8. d16 d8 e | f8. f16 f8 d | e8. e16 e8 cis | d4 r |
f8 f f g | a8 a a f | g8 g g e | f8 f f[ e] |
a,8. d16 d8 e | f8. e16 d8 f | e8. d16 cis8 e | d4 r   
\bar "|." 
}
             


lyricA = \lyricmode {
Vi -- si cie -- ma ku -- kai -- nī -- ši gai -- da ma -- ni no -- mirs -- tam,
Rai -- di ri -- di, rai -- di  ri -- di, rai -- di ri -- di rā!
Vi -- si cie -- ma ku -- kai -- nī -- ši gai -- da ma -- ni no -- mirs -- tam, 
Rai -- di ri -- di, rai -- di  ri -- di, rai -- di ri -- di rā!
}


chordsA = \chordmode {
\time 2/4
d2:m | s2 | a2:m | d2:m | s2 | s2 | a2:m | d2:m |
f2:5 | s2 | c2:5 | f2:5 | d2:m | s2 | a2:m | d2:m 
}

fullScore = <<
\new ChordNames { \chordsA }
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


