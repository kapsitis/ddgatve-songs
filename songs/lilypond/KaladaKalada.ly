\version "2.13.16"
%\header {
%    title = "Kaļadā, kaļadā"
%}
%#(set-global-staff-size 18)
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
g2:5 | g2:5 | g2:5 |
c4:5 g4:5 | g2:5 | g2:5 | 
}

voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
g'8 g b4 | a8 a g4 | g8 g16 g b8 b16 b |
c8 b16 b a8 g | g8 g b4 | a8 a g4
\bar "|."
} 

lyricA = \lyricmode {
\set stanza = #"1." Ka -- ļa -- dā, ka -- ļa -- dā! Ķe -- ka -- tas mā -- mi -- ņa, 
Laid ma -- ni iek -- šā! Ka -- ļa -- dā, ka -- ļa -- dā! 
}

fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
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



