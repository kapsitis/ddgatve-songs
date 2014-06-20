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
s8 f2. f4 bes8 f4 s8 bes4. c f d:min f g:min f4 c8:7 f2.
}

voiceA = \relative c' {
\clef "treble"
\key f \major
\time 3/8
\partial 8

\repeat volta 2 {c8 | f f f | f4 a16 bes | c4 (d8) | c4 } \break
\partial 8 c8 | d bes a | g4 bes8 | c a g | f4 f16 g | a4 (c8) | g4 f16 g | a4 (g8) | f4.~ |f4 s8 \bar"|."
}

lyricA = \lyricmode {
Dievs vi -- sus mūs mīl. all -- le -- lu -- ja!
Lai at -- sau -- cas sirds, lai prieks a -- cīs mirdz, Al -- le -- lu -- ja! Al -- le -- lu -- ja! }


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


