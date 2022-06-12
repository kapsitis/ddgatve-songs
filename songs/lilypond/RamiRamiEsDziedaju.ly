\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Rāmi, rāmi es dziedāju"
%}
% Austras dziesmu burtnīca, 26.lpp.
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
f4 f f g8[ f] | e4 e e8[ d] e4 | 
f4 f f8[ e] f4 | g4 e e8[ d] e4 |
f4. e8 f4 g8[ f] | e4 e8 d e4 d8[ e] | 
f2 g2 | e2. r4  
\bar "|." 
}


lyricA = \lyricmode {
Rā -- mi, rā -- mi es dzie -- dā -- ju, vēl jo rā -- mi ga -- vi -- lē -- ju. 
Rai -- du rī -- di, rai ri -- du rī -- di, rāj, rāj, rāj.
}


chordsA = \chordmode {
\time 4/4
d1:m | c1:5 | d1:m | c1:5 | d1:m | c1:5 | d2:m g2:5 | c2.:5 
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


