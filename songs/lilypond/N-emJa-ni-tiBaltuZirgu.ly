\version "2.13.18"

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% SBTZK, p.4
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key g \major
\time 4/4
d'4 d d b | e4 e e g |
\time 2/4
d8 d d d | d8 d e d | c8 c c b | c8 e d4  

\bar"|."
}

lyricA = \lyricmode {
Ņem, Jā -- nī -- ti, bal -- tu zir -- gu, ap -- jāj ma -- nu 
tī -- ru -- mi -- ņu, ap -- jāj ma -- nu tī -- ru -- miņ'!

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


