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
bes4. a8 d2:min d4.:min c8 f2 bes8 f c d:min g4:min a s8 f b8 f c d:min a4 d2:min
}

voiceA = \relative c' {
\clef "treble"
\key d \minor
\time 2/4
%\dynamicUp

\repeat volta 2 {
d16 d d8 d e | f4 f | f16 f f8 f g | a4 a8 a | bes a g [(f]) | \time 3/4 g4 a r8 a | \time 2/4 bes a g [(f]) | \time 3/4 e4 d2 
% \remove "Time_signature_engraver" 
\once \override Staff.TimeSignature #'stencil = ##f
\time 2/4 |
}
}

lyricA = \lyricmode {
Spi -- ri -- tus Je -- su Chris -- ti, Spi -- ri -- tus ca -- ri -- ta -- tis, con -- fir -- met cor tu -- um; con -- fir -- met cor tu -- um.
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


