\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.28
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 4/4
\phrasingSlurDashed
a'4 a a4. g8 | a4 a8 [bes] c4. bes8 | a4 a8 [bes] c4. bes8 | a4 a a2 |
\repeat volta2 { d4 d8 \(d\) d4. d8 | c4 c d4. c8 | bes4 bes c4. bes8 | a4 a a2 }
}

lyricA = \lyricmode {
\set stanza = "1. "
Es aug -- da -- ma pi bruo -- lei -- ša dau -- dzi dor -- bus ī -- muo -- cēj;
Lā -- guo -- ni lais -- ti spri -- gu -- lei -- ti, žig -- li vil -- kti dzēr -- na -- ven's,
}

lyricB = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Aug -- ši _ cē -- ļu, vīg -- li lai -- žu bruo -- ļa dū -- tu spri -- gu -- leit.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Lyrics \lyricsto "voiceA" \lyricB
%\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


