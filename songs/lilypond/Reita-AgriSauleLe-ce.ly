\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.3
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4
\repeat volta2 {
a'4. g8 | a f e f | g4 c, |
}
\repeat volta 2 {
a'8 a c a | g g g e | d d e d | c c c4
}
}

lyricA = \lyricmode {
Rei -- tā ag -- ri sau -- le lē -- ce, 
Rei -- tā ag -- ri sau -- le lē -- ce
sol -- tu ro -- su nū -- trauk -- dam. 
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\repeat volta 2 {f4. e8 | f d c d | e4 c }
\repeat volta 2 {f8 f a f | e e e e | d d e d| c c c4}

}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
>>
}
>>



\score {
\fullScore
\header { piece = "__" opus = "__" }
}
\markup { \with-color #(x11-color 'white) \sans \smaller "__" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}


