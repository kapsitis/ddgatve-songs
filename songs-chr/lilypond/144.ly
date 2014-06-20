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
d2 g a d b:min g a d d g d g d4 a d2
}

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 4/4

\repeat volta 2 { fis8 fis fis fis g g4 fis8 | e4 d8 e fis fis4 e8 | d4 cis8 d e e4 d8 | cis4 b8 cis d4 r \break }
\repeat volta 2 { r8^\markup { \translate #'(-9 . 0) \italic Refrēns} fis4 fis8 g16 r g g d8 g} | r8 fis4 fis8 g16 r g g d8 g | fis4 e8 e d4 r \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Die -- va mī -- les -- tī -- ba ne -- kad ne -- var beig -- ties, ne -- kad ne -- var beig -- ties, ne -- kad ne -- beig -- sies.
Al -- le -- lu -- al -- le -- lu -- ja, al -- le -- lu -- al -- le -- lu -- ja, al -- le -- lu -- ja!
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


