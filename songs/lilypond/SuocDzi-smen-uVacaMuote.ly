\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.5
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 5/4
a'2 bes4 bes a | \time 4/4 g8 [f] g4 f g | f8 [g] a4 g a8 [g] |
a4 g8 [f] f2 | a4 a f a8 [g] | a4 g8 [f] f2 \bar"|."
}

lyricA = \lyricmode {
Suoc dzīs -- me -- ņu, va -- ca muo -- te, tev vei -- cā -- si,
tev va -- dās, tev vei -- cā -- si, tev va -- dās.
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


