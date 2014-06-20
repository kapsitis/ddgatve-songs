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
s4 f2 bes8 f c4 d4.:min a8 d4.:min c8 f bes c2 s8 f f2 bes8 f c4 d2:min bes:6 c8:sus4 c f2.
}

voiceA = \relative c''{
\clef "treble"
\key f \major
\time 3/4


\repeat volta 2 {\partial 4 r8 a | a4. a8 bes a | g4 f r8 e | f4. g8 a bes | g2 r8 a | a4. a8 bes a | g4 f r8 a | g4. f8 f e | f2.} 
}

lyricA = \lyricmode {
Lai vi -- si Kun -- gam dzie -- dam, lai Vi -- ņu sla -- vē -- jam. Lai vi -- si Kun -- gam dzie -- dam, lai Vi -- ņu sla -- vē -- jam!
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