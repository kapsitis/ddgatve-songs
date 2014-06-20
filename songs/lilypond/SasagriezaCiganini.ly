\version "2.13.16"
%\header {
%    title = "Sasagrieza čigāniņi"
%}
% Dievsētas ļaudis. Gadskārtu dziesmas. 2007 (#29)
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
\key d \major
\repeat volta 2 {
g'16[ fis] e[ d] cis8 a | d8 fis a8. fis16 |
g16[ fis] e[ d] cis8 a | d8 d d4 
}
\repeat volta 2 {
g8 g16[ a] b8 a16[ g] | fis16[ e] fis[ g] a8. fis16 | 
g16[ fis] e[ d] cis8 a | d8 d d4
}
} 


lyricA = \lyricmode {
Sa -- sa -- grie -- za či -- gā -- ni --  ņi is -- ta -- bi -- ņas di -- be -- nā, 
Sa -- griez Diev -- si ru -- dzus, mie -- žus lie -- la -- jā -- i tī -- ru -- mā.  
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


