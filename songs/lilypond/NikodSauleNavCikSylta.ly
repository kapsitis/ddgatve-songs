\version "2.13.18"
#(ly:set-option 'crop #t)
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.114
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 3/4 f4. a8 g e | \time 2/4 f d c c | f f g g | c c a4 |
\time 3/4 c4. f,8 d'8 c | \time 2/4 bes a g f | e g c bes | a g f4 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Ni -- kod sau -- le nav cik syl -- ta, kai ir syl -- ta pa -- va -- sar.
Ni -- kod sau -- le nav cik syl -- ta, kai ir syl -- ta pa -- va -- sar.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
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


