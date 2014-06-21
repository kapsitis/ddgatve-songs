\version "2.13.16"
%\header {
%    title = "Ai, saulīte, Mēnestiņi", "Spēka dziesmas", 62.lpp. 
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
\key d \minor
\time 7/4
d4 a' g8 bes a4 d, d8 e f[ d] | g4 f8 e d4 c8[ d16 e] d4. e8 f8[ d] | 
\time 6/4
g4 f8 e d4 c8[ d16 e] d2
\bar "|."
} 

lyricA = \lyricmode {
Ai, Sau -- lī -- te, Mē -- nes -- ti -- ņi, 
Kā jūs skais -- ti mi -- ja -- tie -- si, 
Kā jūs skais -- ti mi -- ja -- ties!
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


