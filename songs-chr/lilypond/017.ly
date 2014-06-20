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

voiceA = \relative c''{
\clef "treble"
\key e \minor
\time 3/4
b2. (| a2) b4| g2. (| b2) g4 | fis2 (g4) | a b c | <e, c'>2. | <dis b'> | g2 a4 | b2 e,4 | fis2. | e \bar "|."
}

lyricA = \lyricmode {
\set stanza = #"1./2. "
Die -- va Jērs, kas nes pa -- sau -- les grē -- kus, ap -- žē -- lo -- jies par mums.
}
lyricB = \lyricmode {
\set stanza = #"3. "
Die -- va Jērs, kas nes pa -- sau -- les grē -- kus, dā - vā mums mie -- ru.
}

fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
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