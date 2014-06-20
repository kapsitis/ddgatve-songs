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

voiceA = \relative c'' {
\clef "treble"
\key c \major
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
\time 2/4

\mark \markup {\circle \bold 1} 
g8 g g g | g g g g |
\mark \markup {\circle \bold 2} 
c4 b8 a | g2 |
\mark \markup {\circle \bold 3} 
a4 g8 f | e2 |
\mark \markup {\circle \bold 4}
f4 e8 d | c2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. " 
Die -- vam Tē -- vam pa -- teik -- si -- mies,
Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja.
}
lyricB = \lyricmode {
\set stanza = "2. "
Svē -- to Ga -- ru sla -- vēt steig -- sim,
Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja.
}
lyricC = \lyricmode {
\set stanza = "3. "
Jē -- zu Kris -- tu go -- di -- nā -- sim,
Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja.
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


