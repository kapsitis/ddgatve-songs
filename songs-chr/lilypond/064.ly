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
\key g \major
\time 4/4
\override Score.RehearsalMark #'break-align-symbols = #'(time-signature)

\repeat volta 2 { 
\mark \markup { \circle \bold 1 } g4  g a a8 g | fis2 g \bar"||"
\mark \markup { \circle \bold 2 } b4 b c c8 b | a2 b \bar"||"
\mark \markup { \circle \bold 3 } g e | d g
}
}

lyricA = \lyricmode {
\set stanza = "1. "
Die -- vam Tē -- vam lai sla -- va, at -- spīd Gais -- ma lai Ta -- va, mī -- lu Te -- vi.
}
lyricB = \lyricmode {
\set stanza = "2. "
Jē -- zum Kris -- tum lai sla -- va, at -- spīd Gais -- ma lai Ta -- va, mī -- lu Te -- vi.
}
lyricC = \lyricmode {
\set stanza = "3. "
Svē -- tam Ga -- ram lai sla -- va, at -- spīd Gais -- ma lai Ta -- va, mī -- lu Te -- vi.
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


