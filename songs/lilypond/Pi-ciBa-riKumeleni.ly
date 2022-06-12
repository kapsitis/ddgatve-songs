\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.49
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
  g'8 g g g | c c16 [bes] a8 a | g g g g | c c16 [bes] a4 |
  \stemDown
  \autoBeamOn
  \repeat volta 2 {
    c16 bes a bes c bes a bes 
  }
  \alternative {
    { c16 bes a g \stemNeutral f8 f }
    {\stemDown c'16 bes a g \stemNeutral f4 \bar"|."}
  }
}

lyricA = \lyricmode {
  \set stanza = "1. "
Pī -- ci bā -- ry ku -- me -- le -- ņi vys ar au -- zom ba -- ro -- jam,
ra -- di- ri -- di, ra -- di- ri -- di, ra -- di- ri -- di ri -- tam, ra -- di- ri -- di ram.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
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


