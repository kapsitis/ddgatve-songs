\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Atīdami Zīmys svātki"
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
c2:5 | f4:5 c4:5 | g4:5 c4:5 | f4:5 c4:5 | 
c2:5 | f4:5 c4:5 | g4:5 c4:5 |  
}


voiceA = \relative c' {
\time 2/4
\clef "treble"
%MS
e8 e d e | f8 f e e | d8 c c4  | 
%ME
f8 e e4 |
e8 e d e | f8 f e e | d8 c c4 
\bar "|."
} 

lyricA = \lyricmode {
At -- ī -- da -- mi Zī -- mys svāt -- ki, ka -- la -- dō, ka -- la -- dō! 
kū jyus lo -- bu at -- na -- su -- ši? ka -- la -- dō!
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


