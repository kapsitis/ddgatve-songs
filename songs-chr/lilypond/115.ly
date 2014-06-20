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

chordsA = \chordmode {
e1. b2.:7 e:min g1. d2.:7 g g:7 c b:7 e:min
}

voiceA = \relative c' {
\clef "treble"
\key e \minor
\time 3/4
%\dynamicUp

e2 e4 | e dis e | g fis2 | e2. | g2 g4 | g fis g | b a2 | g2. | b2 b4 | c b e, | g fis2 | e2. \bar"|."
}

lyricA = \lyricmode {
\set stanza = #"1. "
Jē -- zu, ie -- mā -- ci mūs lūg -- ties! Jē -- zu, ie -- mā -- ci mūs lūg -- ties! Jē -- zu, ie -- mā -- ci mūs lūg -- ties!
}
lyricB = \lyricmode {
\set stanza = #"2. "
Jē -- zu, pie -- dod mū -- su grē -- kus! Jē -- zu, pie -- dod mū -- su grē -- kus! Jē -- zu, pie -- dod mū -- su grē -- kus!
}
lyricC = \lyricmode {
\set stanza = #"3. "
Jē -- zu, dod mums žē -- las -- tī -- bu! Jē -- zu, dod mums žē -- las -- tī -- bu! Jē -- zu, dod mums žē -- las -- tī -- bu!
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
\lyricsto "voiceA" \new Lyrics \lyricC
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


