\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.11
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 4/4
f4 bes a4. g8 | f g a4 f2 | f4 bes a4. g8 | f8 g a4 f2 |
\repeat volta 2 { \time 2/4 bes8 bes bes bes | a a a a | g g a g | f f f4}
}

lyricA = \lyricmode {
Vy -- si mu -- ni vē -- ji pyu -- te, vy -- si ļau -- dis ap -- ru -- nuo -- ja,
Vy -- si mu -- ni vē -- ji pyu -- te, vy -- si ļau -- dis ap -- ru -- nuoj'.
}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
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


