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
d1. d2. a e1.:min a2. d
}

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 3/4
%\dynamicUp

fis8 fis fis fis fis4 | fis8 d d2 | fis8 (g) g fis fis g | e4 e2 |
g8 g g g g4 | g8 e e2 | g8 (b) a g fis e | fis2. \bar"|."
}

lyricA = \lyricmode {
Pa -- tei -- ca -- mies Tev, Jē - zu, par Ta -- vu mī -- les -- tī -- bu. 
Pa -- tei -- ca -- mies Tev, Jē - zu. Al -- le - lu - ja!
}

lyricB = \lyricmode {
Con -- fi -- te -- mi -- ni Do -- mi -- no quo -- ni - am _ bo -- nus.
Con -- fi -- te -- mi -- ni Do -- mi -- no. Al -- le - lu - ja!
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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


