\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kūru, kūru uguntiņu ",AA lapas, Jāņi
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
a2:m | a2:m | a2:m | 
e2:m | a2:m | e4:m a4:m | 
}

voiceA = \relative c' {
\clef "treble"
\key a \minor
\time 2/4
e8 e e e |
g8 e e d |
e8 g a e |
d8 c16[ d] e4 |
a,8 c  e e |
d8 c16[ b] a4 |
\bar "|."
} 

lyricA = \lyricmode {
Kū -- ru, kū -- ru u -- gun -- ti -- ņu 
tum -- ša -- jā -- i nak -- sni -- ņā, 
tum -- ša -- jā -- i nak -- sni -- ņā.
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


