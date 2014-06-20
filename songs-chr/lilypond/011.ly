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

voiceA = \relative c'' {
\clef "treble"
\key d \minor
\time 2/4

a16 g a4 d,8 | f4 e | d4. r8 | d'16 c d4 g,8 | bes4 a | g4. r8 | f16 g a4 f8 | e4 c | d4. r8 | a' a4 a8 | bes4 g | f4. r8 | f f4 f8 | g4 e | d4. r8 | e e4 e8 | f4 g | a4. r8 \bar "|."
}

lyricA = \lyricmode {
\set stanza = #"1./3. "
Ky -- ri -- e e -- le -- i -- son, Ky -- ri -- e e -- le -- i -- son, Ky -- ri -- e e -- le -- i -- son. \set stanza = #"2. "Chris -- te e -- le -- i -- son, Chris -- te e -- le -- i -- son, Chris -- te e -- le -- i -- son.
}


fullScore = <<
%\new ChordNames { \chordsA }
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

