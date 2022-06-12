\version "2.13.18"
#(ly:set-option 'crop #t)
\include "deutsch.ly"

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
\time 2/4
e8 d f f | e d d d | e d f4 | e8 d d4 | e8 d f f | e d d d | c d d4 \bar"|."

}

lyricA = \lyricmode {
Svāt -- ki guo -- ja, svāt -- ki guo -- ja, ka -- la -- dū, ka -- la -- dū 
Ei -- ma bār -- ni čy -- guo -- nū -- si, ka -- la -- dū.



}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
%\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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



