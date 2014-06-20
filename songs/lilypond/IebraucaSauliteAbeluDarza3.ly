\version "2.13.16"
%\header {
%    title = "Iebrauca saulīte ābeļu dārzā"
%}
% F/g "Laiva", rokraksts - balta_mape1.pdf, p.7
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
\key b \minor
\time 2/4
\repeat volta 2 {
fis4 e8 e | fis4 cis8 cis | d4 cis8 cis | d4 b | 
fis'4 e8 e | fis4 cis8 cis | d4 cis8 cis | b4 b
}
} 


lyricA = \lyricmode {
Ie -- brau -- ca Sau -- lī -- te ā -- be -- ļu dār -- zā, 
De -- vi -- ņi ra -- ti -- ņi, simts ku -- me -- li -- ņi.
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


