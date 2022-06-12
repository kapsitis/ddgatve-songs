\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% Grodi (sakārtojis G.Dovgjallo); lpp. 127 
\layout {
indent = #0
ragged-last = ##f
}

voiceA = \relative c' {
\clef "treble"
\key d \major
\time 2/4
a'8 fis a fis | g8 e fis d'   
\time 4/4
b4 a d fis, | 
\time 2/4
g8 e g e | 
fis8 d e b' |
a4 fis8[ e] | 
d2
\bar "|."
}


lyricA = \lyricmode {
\set stanza = "1. "
Aiz kal -- ni -- ņa mē -- nes -- ti -- ņis, ai -- jā, žū -- žū, 
Ri -- pu, rā -- pu uz -- rā -- po -- ja, žū -- žū -- žū. 
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
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


