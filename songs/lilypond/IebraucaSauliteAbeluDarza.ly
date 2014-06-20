\version "2.13.16"
%\header {
%    title = "Iebrauca saulīte ābeļu dārzā"
%}
% F/g "Laiva", rokraksts - dzeltena_mape.pdf, p.12
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
\time 2/4
\clef "treble"
\key c \major
\time 2/4
\phrasingSlurDashed
g'4 g8\( e\) | g4 a8 g | f4 f8 d | f4 g8[ f] 
\repeat volta 2 {
e4 e8 e | e4 f8 e | d4 e8 d | c4 c
}
} 


lyricA = \lyricmode {
Ie -- brau -- ca Sau -- lī -- te ā -- be -- ļu dār -- zā, 
De -- vī -- ni ra -- tī -- ni, simts ku -- me -- lī -- ni.
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


