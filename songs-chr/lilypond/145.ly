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
s4 es1 bes:7 s1 es1 c:min as:6 f:7 bes:7 es as2 bes:7 es1
}

voiceA = \relative c' {
\clef "treble"
\key es \major
\time 4/4
\partial 4

es4~ | es es d8 es f g | g2 f4 es | es d es f | es2. r8 es | es2. f8 g | g4 f f f8 f | f4. f8 f4 g8 f | f1 es1~ | es4 f f es | es1 \bar"|."
}

lyricA = \lyricmode {
\set stanza = #"1. "
Ma -- rij, kad uz Te -- vi rau -- gos, man gai -- šums pre -- tī plūst. Un at -- spī -- dums Ta -- vās a -- cīs ļauj Die -- va skais -- tu -- mu just. Ma -- rij, šķīs -- tā -- kā!
}
lyricB = \lyricmode {
\set stanza = #"2. "
Ma -- rij, kad uz Te -- vi rau -- gos, man mai -- gums pre -- tī plūst. Tavs miers pār -- ņem ma -- nu sir -- di un bai -- lēm at -- kāp -- ties liek. Ma -- rij, mai -- gā -- kā!
}
lyricC = \lyricmode {
\set stanza = #"3. "
Ma -- rij, re -- dzot Ta -- vu smai -- du, kas lab -- vē -- lī -- bu pauž. Tev uz -- drīk -- stos tu -- vo -- ties, sirds man sa -- jūs -- mā ga -- vi -- lē. Ma -- rij, svē -- tā -- kā!
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


