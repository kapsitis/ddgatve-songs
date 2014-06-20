\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.115
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key d \major
\time 6/8
\repeat volta 2 {fis8 a a b e, fis | g b b a16 [g] fis4 }
\repeat volta 2 {fis8 e d cis b a | g'g a a16 [g] fis4 }
}

lyricA = \lyricmode {
\set stanza = "1. "
Na -- ta -- ki spū -- lei -- te bez skrī -- mes -- te -- ņa, na -- ī -- šu tau -- te -- ņuos bez buo -- le -- le -- ņa.
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


