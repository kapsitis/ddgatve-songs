\version "2.13.16"
%\header {
%    title = "Lēni, lēni Dieviņš brauca"
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
\time 5/4
c''4. b'8 a' g' a' e' e' e' 
\time 6/2
a'8 a' a' b' c''4 c''8[ d''8] e''4. d''8 c'' c'' b' b' c''4 b' a'2
\bar "|."
} 

lyricA = \lyricmode {
Lē -- ni, lē -- ni Die -- viņš brau -- ca 
No kal -- ni -- ņa le -- ji -- ņā -- ji, No kal -- ni -- ņa le -- ji -- ņā.
}

fullScore = <<
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
\markup { \with-color #(x11-color 'white) \sans \smaller "__" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}



