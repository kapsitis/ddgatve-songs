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
s4. g1 c2 a:min d1 c4 g2. d4:7 g1 c2 a:min d1:7 g4
}

voiceA = \relative c' {
\clef "treble"
\key g \major
\time 4/4
\partial 4.

d8 d d | g4 g r8 g g fis | e4 e r8 e e g | fis4 fis r8 e e fis | e4 d  r4 s \break
\partial 4 d8^\markup {\translate #'(-7 . 0) \italic Piedz.} d | g4 g r g8 fis | e4 e r e8 g | fis4 fis r8 fis e fis | g4 r r   \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Es mī -- lu Jē -- zu, es mī -- lu Jē -- zu, es mī -- lu Jē -- zu, es mī -- lu Jē -- zu.
Al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu -- ja! }


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


