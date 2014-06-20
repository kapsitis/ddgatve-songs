\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.12
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
\phrasingSlurDashed
g'4 e8 f | g4 e8 \(e\) | g \(f\) e d | c4 c |
d8 d d f | e e e e | f [e] d d | c4 c |
d8 d d f | e e e e | d4 d8 d | c4 c |
c8 d e f | g f e f | g [f] e d | c4 c |
d8 d d f | e e e e | f [e] d d | c4 c |
d8 d d f | e e e e | d4 d8 d | c4 c \bar"|."
}

lyricA = \lyricmode {
\set stanza = "1. "
Uo -- zei -- ti mu -- nu, _ ku -- re ža tu be -- ji?
Pat -- ma -- ļo -- si, pat -- ma -- ļo -- si, kun -- dze -- ni mu -- nu,
pat -- ma -- ļo -- si, pat -- ma -- ļo -- si, kun -- dze -- ni mu -- nu.
\set stanza = "3. "
Kai te -- vi tī na -- sa -- sy -- ta, uo -- zei -- ti mu -- nu?
Sy -- ta, sy -- ta, kai na -- sy -- ta, kun -- dze -- ni mu -- nu,
sy -- ta, sy -- ta, kai na -- sy -- ta, kun -- dze -- ni mu -- nu.
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


