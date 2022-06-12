\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.29
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4
\phrasingSlurDashed
\slurUp
g'4 f8 f e \(e\) e f | g4 f8 f e \( e\) e \(e\) |
c ( \(c\) d ) d e4 f | g8 \(g\) f f f [e] e4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Vis -- te -- ņa ka -- cy -- nuo -- ja, žo -- go -- ta ča -- cy -- nuo -- ja,
bēr_-_ne__-__ni rau -- duo -- ja, va -- ca -- muo -- te ruo -- ja.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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


