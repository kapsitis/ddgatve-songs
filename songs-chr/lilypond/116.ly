\version "2.13.18"

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
c2.:min f:min bes es as f:min6 g:7 c:min
}

voiceA = \relative c'' {
\clef "treble"
\key es \major
\time 3/4
%\dynamicUp

g4 g r8 g | as g as4 r | f8 f f f es f | g f g2 |
es4 es r8 es | f es f4 r4 | d8 d d d c d | es es es2 \bar"|."
}

lyricA = \lyricmode {
Jē -- zu, mūs pie -- mi -- ni, kad Tu bū -- si sa -- vā val -- stī -- bā. 
Jē -- zu, mūs pie -- mi -- ni, kad Tu bū -- si sa -- vā val -- stī -- bā. 
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
\markup { \with-color #(x11-color 'white) \sans \smaller "aaa" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}


