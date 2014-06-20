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

%chordsA = \chordmode {}

voiceA = \relative c' {
\clef "treble"
\key g \major
\time 4/4

d4. (e8) g2 | b4. (a8) g2 | e8 g g g a4 g | e8 g g g e4 (d) |
d4. (e8) g2 | b4. (a8) g2 | b8 b b g b4 a | g2 \bar"|." 
}

lyricA = \lyricmode {
\set stanza = "1. "
Sla -- vē, sla -- vē, sla -- vē kat -- ru rī -- tu, sla -- vē pus -- die -- nā,
sla -- vē, sla -- vē, sla -- vē Die -- vu va -- ka -- rā. }
lyricB = \lyricmode {
\set stanza = "2. "
Lū -- dzies, lū -- dzies, lū -- dzies kat -- ru rī -- tu, lū -- dzies pus -- die -- nā,
lū -- dzies, lū -- dzies, lū -- dzies Die -- vu va -- ka -- rā. }
lyricC = \lyricmode {
\set stanza = "3. "
Dzie -- di, dzie -- di, dzie -- di kat -- ru rī -- tu, dzie -- di pus -- die -- nā,
dzie -- di, dzie -- di, dzie -- di Die -- vam va -- ka -- rā.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
\lyricsto "voiceA" \new Lyrics \lyricC
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


