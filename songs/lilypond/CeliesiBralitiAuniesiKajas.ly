\version "2.13.16"
%\header {
%    title = "Celiesi, brālīti, auniesi kājas"
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
\time 6/8
c8^"runājoši, mērenā tempā" f e e d c | e8 d d c e4 | c8 e4 d8 c4 
} 

lyricA = \lyricmode {
Ce -- lie -- si, brā -- lī -- ti, au -- nie -- si kā -- jas, 
lī -- go, lī -- go. 
}

chordsA = \chordmode {
\time 6/8 
c2.:5 | c2.:5 | c2.:5
}


fullScore = <<
\new ChordNames { 
\set chordChanges = ##t
\chordsA 
}
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



