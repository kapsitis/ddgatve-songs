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
c2 e:min g a:min d1:min g2
c2 e:min g a:min d1:min g2
}

voiceA = \relative c'' {
\clef "treble"
\key c \major
\time 2/4

c4 g8 c | b4. a8 | g4 g | e2 | f4 f| g a | g2 |
c4 g8 c | b4. a8 | g4 g | e4 f8 e | d4 d | d c8 b | c2 \bar"|." 
}

lyricA = \lyricmode {
\set stanza = "1. "
Es Te -- vi svei -- cu, Ma -- ri -- ja, Jē -- zus mā -- mi -- ņa.
Es Te -- vi svei -- cu, Ma -- ri -- ja, es kā Jē -- zus es -- mu Tavs bērns.
}
lyricB = \lyricmode {
\set stanza = "2. "
Kad Te -- vi lū -- dzu, Ma -- ri -- ja, līk -- smo ma -- na sirds.
Es Te -- vi lū -- dzu, Ma -- ri -- ja, lai Tu vien -- mēr e -- si man klāt.
}
lyricC = \lyricmode {
\set stanza = "3. "
Es Te -- vi svei -- cu, Ma -- ri -- ja, viss es es -- mu Tavs.
Es Te -- vi lū -- dzu: ma -- ni ved caur šo dzī -- vi kā vē -- lies Tu.
}

fullScore = <<
\new ChordNames { \chordsA }
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


