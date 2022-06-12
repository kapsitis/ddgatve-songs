\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% Budēļu grāmata, 25lpp.
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c
 \major
\time 2/4
c8 d e e |
f8 e d c8 |
\time 4/4
e4 e8[ a] g2 |
\time 2/4
e8 e e g |
f8 e d c |
\time 4/4
d4 f8[( e16 d]) c2 |
\bar"|."
}

lyricA = \lyricmode {

Ne -- tī -- šā -- mi es ie -- gā -- ju, es ie -- gāj', mī -- ļās Mā -- ras is -- ta -- bā -- i, is -- ta -- bā.
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


