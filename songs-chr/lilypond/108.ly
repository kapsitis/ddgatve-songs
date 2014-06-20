\version "2.13.18"


\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}

\layout {
indent = #0
ragged-last = ##f
}

%chordsA = \chordmode {}

voiceA = \relative c'{
\clef "treble"
\key g \major
\time 2/4

\stemUp d8^\markup {1.}\( fis b a\) | fis^\markup {2. \italic Ju-bi-la-te...} d4 r8 | d \(fis b [a] | fis4\) r | \stemNeutral d'8 \( \stemUp a b4 | a8 fis g4 | fis8 d e e | d4\) r |
d'8 a b a | d a b a | fis \(d e e | fis4\) r | d'8 a b a | d a b a | fis \(d e e\) | fis2 \bar"|."
}

lyricA = \lyricmode {
Ju -- bi -- la -- te 
De -- o om -- nis ter -- ra. Ser -- vi -- te Do -- mi -- no in lae -- ti -- ti -- a.
Al -- le -- lu -- ia, al -- le -- lu -- ia in lae -- ti -- ti -- a! Al -- le -- lu -- ia, al -- le -- lu -- ia in lae -- ti -- ti -- a!
}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
>>
}
>>


\score {
\fullScore
\header { piece = "__" opus = "__" }
}
\markup { \with-color #(x11-color 'white) \sans \smaller "aaa" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}