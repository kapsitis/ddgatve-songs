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
s8 e2. a e b:7 e a e4. b:7 e2. e a e b:7 e4. b:7 e2.
}

voiceA = \relative c' {
\clef "treble"
\key e \major
\time 12/8
\partial 8

b8 | gis'4 gis8 gis ([fis]) e a4 a8 a ([gis]) fis | gis4~ gis8 gis ([a]) b fis4.~ fis4 b,8 |
gis'4 gis8 gis ([fis]) e a4 a8 a ([gis]) fis | gis4~ gis8 fis4 fis8 e4.~ e |

\repeat volta 2 {
b'4.~ b cis~ cis8  b a }
\alternative {
  {gis4 gis8 gis (a) b fis4.~ fis }
  {gis4 gis8 fis4 fis8 e4.~ e \bar"|."}
}
}

lyricA = \lyricmode {
Cik mī -- les -- tī -- bu lie -- lu mums ir dā -- vā -- jis Tēvs.
Cik mī -- les -- tī -- bu lie -- lu mums ir dā -- vā -- jis Tēvs.
Lai mēs Die -- va bēr -- ni va -- ram būt. bēr -- ni va -- ram būt.
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


