\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Kur bijāti, Ziemassvētki"
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




voiceA = \relative c' {
\clef "treble"
\key a \minor
\time 2/4
a8^"la" a a a | a'8^"Fa" a a a | g8^"sol" f g a | g8^"Do" f e4 |
c8^"Do" c c d | e8^"Do" e e e | d8^"re" c b c | b8^"la" a a4 
\bar "|."
} 

lyricA = \lyricmode {
Kur bi -- jā -- ti, Zie -- mas -- svēt -- ki, kur nak -- sni -- ņu gu -- lē -- jāt?
Kur bi -- jā -- ti, Zie -- mas -- svēt -- ki, kur nak -- sni -- ņu gu -- lē -- jāt?
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


