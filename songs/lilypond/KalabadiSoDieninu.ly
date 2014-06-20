\version "2.13.16" 
%\header {
% title = "Kālabadi šo dieniņu"
%}
% Austras Dziesmu burtnīca, "Dievēn, zini, kālabad"
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
\time 3/4
f4. c8 f f \time 2/4
c8 c16[ bes] a8 a | f'8 f a a | g8 g a8. g16 |
f8 d f f | c8 c16[ bes] a8 a | f'8 f16[ e] d8 d | a8 a d4~ \time 3/4
d2 r4 \bar "|."
}


lyricA = \lyricmode {
Kā -- la -- ba -- di šo die -- ni -- ņu
Es ne -- va -- ru līg -- sma bū -- ti?
Kā -- la -- ba -- di šo die -- ni -- ņu
Es ne -- va -- ru līg -- sma būt?
}

chordsA = \chordmode {
\time 3/4
f2.:5 \time 2/4
c4:5 a4:m5 | d2:m5 | g4:m5 a4:m5 |
d2:m5 | c4:5 a4:m5 | d2:m5 | a4:m5 d4:m5 
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
\markup { \with-color #(x11-color 'white) \sans \smaller "__" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}


