\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.141
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 2/4
f8 f f c | f4 g8 [a] | a4. f8 | a a bes a |
g4 f8 [e] | d4. e8 | f f a a | g4 f8 [e] | d2 \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Muo -- te dē -- le -- ņu auk -- lē -- ja 
vīg -- las dī -- nas dū -- muo -- da -- ma, 
vīg -- las dī -- nas dū -- mo -- dam.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics  \lyricA
%R\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


