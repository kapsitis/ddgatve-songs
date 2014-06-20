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
s4 c2 g c g1 c2 d1:7 c2 g c g1 c2 d1 g2 d g1 c d g2 d e1:min a2:min d:7 g2.
}

voiceA = \relative c' {
\clef "treble"
\key g \major
\time 4/4
\partial 4

d8 d | e4. g8 g4 d8 d | e4. g8 g4 g8 a | b4 g c b |
b a r d,8 d | e4. g8 g4 d8 d | e4. g8 g4 g8 a | b4 g c b | a2 \bar"||" \break
r8^\markup { \translate #'(-8 . -1) \italic Refrēns} a b c | d4. d8 d4 c | c b r8 b a b | c4. c8 c4 b |
a2 r8 a8 b c | d4. d8 d4 c | c b r8 b a b | c4 b a4. g8 | g2. \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Mū -- su dvē -- se -- lēs Die -- vu sla -- vē -- sim, Vi -- ņam pie -- der gods un va -- ra.
Tas ir mū -- su Kungs, kas pār pa -- sau -- li val -- da vi -- sā go -- dī -- bā.
Al -- le -- lu -- ka! Kungs tie -- šām val -- da! Lai Vi -- ņam 'Al -- le -- lu -- ja' skan!
Al -- le -- lu -- ka! Kungs tie -- šām val -- da! Lai Vi -- ņam 'Al -- le -- lu -- ja' skan!
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


