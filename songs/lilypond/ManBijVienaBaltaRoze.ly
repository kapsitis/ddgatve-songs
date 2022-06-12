\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Man bij' viena balta roze"
%}
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


voiceA = {
\clef "treble"
\key a \minor
\time 4/2
a'8 b' c'' a' d'' d'' c''16[ b'] a'8 d''4 e'' d''8.[ c''32 b'] a'4 |
e''8 e'' d'' e'' c''16 b' a'8 g' e' a'4 d'' a'2
\bar "|."
} 

lyricA = \lyricmode {
Man bij vie -- na bal -- ta ro -- ze, bal -- ta ro -- ze, 
Ne -- zi -- nā -- ju, ku -- re stā -- dī -- tu, kur stā -- dīt.
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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



