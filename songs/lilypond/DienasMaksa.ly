\version "2.13.16"
%\header {
%    title = "Dienas maksa"
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


voiceA = \relative c'' {
\clef treble
\key g\major 
\time 2/4
\override Score.BarNumber 
#'break-visibility = #end-of-line-invisible
\break
g8 b d d | c16[ b] a8 g d | 
g b d d | c16[ b] a8 g4 |
g4-> b4-> | d16-> c b8 c16-> b a8 | g2 
}

lyricA = \lyricmode {
Mak -- sā -- ja -- t(i), sve -- ši ļau -- dis, es ne -- dē -- ļu
iz -- dzie -- dāš', trā -- rā, ra -- di -- rā, ra -- di -- rā -- rā!
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


