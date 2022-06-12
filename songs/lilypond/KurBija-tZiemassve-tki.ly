\version "2.13.18"
#(ly:set-option 'crop #t)
\include "deutsch.ly"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.134
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key a \minor
\time 3/8
e8 d( f) | d4 e8 | f e16( f) d e | \time 2/4 e8 d\fermata e16( f) e8 | 
\time 3/8 e d( f) | d4 e8 | f e16( f) d e| \time 2/4 e8 d\fermata e16( f) e \bar"|."
}

lyricA = \lyricmode {
Kur bi -- jā -- ti Zie -- mas -- svēt -- ki, kur naks -- ni -- ņu gu -- lē -- jā -- ti,
kur naks -- ni -- ņu gu -- lē -- jā -- ti.



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



