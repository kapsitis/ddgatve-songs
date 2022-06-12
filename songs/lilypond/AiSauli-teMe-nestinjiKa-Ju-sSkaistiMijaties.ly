\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Ai, saulīte, Mēnestiņi",AA lapas
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
\key c \major
\repeat volta 2 {
\time 3/4
d4 g f8 a |
g4 d d8 e |
f8( d) g4 f8 e |
\time 4/4
d4 c8( e) d2 |
}
} 

lyricA = \lyricmode {
Ai, Sau -- lī -- te, Mē -- nes -- ti -- ņi, kā jūs skais -- ti mi -- ja -- ties!
} 

lyricB = \lyricmode {
Kur die -- ni -- ņu Sau -- le te -- ka, nak -- tī te -- ka Mē -- nes -- tiņš. 
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Lyrics \lyricsto "voiceA" \lyricB
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


