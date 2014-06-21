\version "2.13.18"
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% Nāc, Dieviņi, uz manīmi (FkLaiva; AALapas)
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 2/4
c8 c e8. c16 | e8 d c c | e8 f g8. e16 | g8 g f a |
g8 g f8. d16 | e16[ f] g8 c, c | d8 e f( e16) d | c8 g c4
\bar"|."
}

lyricA = \lyricmode {
Nāc, Die -- vi -- ņi, uz ma -- nī -- mi 
Šo -- va -- ka -- ru va -- ka -- rē -- ti:
Bal -- ti ma -- ni lie -- pas gal -- di, 
Tī -- ra ma -- na is -- ta -- biņ'. 
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


