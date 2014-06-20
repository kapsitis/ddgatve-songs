\version "2.13.16"
%\header {
%    title = " Lielupīte lielījās: es bagāta mātes meit'",Budēlīši, jūra
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
\key fis \minor
\time 4/4
a'4 b cis4. cis8 |
b4( e8) d cis4 b |
fis4 b a( gis8) fis |
e4( a8) gis fis4. gis8 |
a4 b cis4. gis8 |
fis4( e8) e fis2 |
\bar "|."
}

lyricA = \lyricmode {
 Liel -- u -- pī -- te lie -- lī -- jā -- si: es ba -- gā -- ta mā -- tes mei -- ta, es ba -- gā -- ta mā -- tes meit',
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


