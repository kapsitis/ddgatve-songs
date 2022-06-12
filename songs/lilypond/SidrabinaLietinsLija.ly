\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Sidrabiņa lietiņš lija"
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
d2:m | d2:m | d2:m | d2:m | 
d2:m | d2:m | d2:m | d2:m | 
}



voiceA = \relative c' {
\clef "treble"
\key d \minor
\time 2/4
\repeat volta 2 {
d8 f d d  | d8 a d d | d8 f d4 | d8 c d4 | d8 f d d | d8 a d d | d8 f d4 | d8 c d4
}
} 

lyricA = \lyricmode {
Sid -- ra -- bi -- ņa lie -- tiņš li -- ja, ka -- la -- dū, ka -- la -- dū, 
Zie -- mas -- svēt -- ku va -- ka -- rā -- i, ka -- la -- dū, ka -- la -- dū.
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


