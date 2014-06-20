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
s2 g1.. s4 c1 g1.. s4 g1 d1. d1 d2:7 g1. s2
}

voiceA = \relative c'{
\clef "treble"
\key g \major
\time 4/4
\partial 2

d4 e
\repeat volta 2 { g2 g4 a | b b b a | g2 g4 g | e d d e | g2 g4 a }
\alternative {
  { b4 b a g | a1~ | a4 r b a }
  { b4 b a a | g1~ | g4 r2. \bar "|." }
}
}

lyricA = \lyricmode {
\set stanza = "1. "
Die -- va prieks ir tas a -- vots, Die -- va prieks ir tas a -- vots, Die -- va prieks, lai tas \set stanza = "1.-3. " pār -- ņem vi -- sus mūs. Die -- va pār -- ņem vi -- sus mūs.
}
lyricB = \lyricmode {
\set stanza = "2. "
Die -- va mī -- la ir a -- vots, Die -- va mī -- la ir a -- vots, Die -- va mī -- la lai
}
lyricC = \lyricmode {
\set stanza = "3. "
Die -- va miers ir tas a -- vots, Die -- va miers ir tas a -- vots, Die -- va miers, lai tas
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