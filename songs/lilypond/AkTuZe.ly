\version "2.13.16"
%\header {
%    title = "Ak, tu žē"
%}
%#(set-global-staff-size 18)
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
\clef treble
\key d\major 
\time 2/4
\override Score.BarNumber 
#'break-visibility = #end-of-line-invisible
\break
\repeat volta 2 {
fis8 a a4 | fis8 a a4 | 
e8 g fis e | d8 d d4 \break
}
\repeat volta 2 {
d8 d g g | b8 b b b | 
cis a a fis | 
}
\alternative { 
{g8 g g e} 
{g g g g} 
}
}

lyricA = \lyricmode {
Ak, tu žē, ak, tu pē, 
kam tu nā -- ci bal -- lī -- tē?
Mei -- ti -- ņa no ma -- zām die -- nām 
rak -- stī -- ja uz bal -- tām sie -- nām;
bal -- tām sie -- nām. 
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


