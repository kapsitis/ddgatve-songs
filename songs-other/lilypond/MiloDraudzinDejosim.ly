\version "2.13.16"
%\header {
%    title = "Mīļo draudziņ, dejosim"
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
\clef treble
\key f\major 
\time 2/4 \tempo 4=76
\override Score.BarNumber 
#'break-visibility = #end-of-line-invisible
\break
c8 f f f | e g c,4 |
c8 e g bes | a c f,4 |
a8 a bes4 | g8 g a4 |
f8 f g g | e e f4 
\bar "|."
}

lyricA = \lyricmode {
Mī -- ļo drau -- dziņ, de -- jo -- sim, 
a -- bas ro -- kas sa -- do -- sim!
Vien -- reiz šur, vien -- reiz tur, 
ap -- kārt griez -- ties: vur, vur, vur!
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


