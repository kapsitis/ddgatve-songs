\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Mačiau ėšjuojont"
%}
% "Skamba, skamba kankliai, 1993"
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


#(define ((compound-time one two num) grob)
  (grob-interpret-markup grob
    (markup #:override '(baseline-skip . 0) #:number
      (#:line (
          (#:column (one num))
          #:vcenter "+"
          (#:column (two num))))
      )))



voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4
d'8. c16 b8 a d2 | d8 d d b a2
\override Staff.TimeSignature #'stencil = #(compound-time "4" "3" "4")
\time 7/4
g8 a b a d2 \bar "dashed" d4 b2
\bar "|."
}

lyricA = \lyricmode {
Ma -- čiau eš -- juo -- jont, ma -- čiau par -- juo -- jont,
ma -- čiau žėr -- gos bal -- nuo -- jont.
}

voiceB = \relative c' {
\clef "treble"
\time 4/4
\key c \major
r2 <<g'2 b>> | <<g8 b>> <<g b>> a8 g d2
\time 7/4
g8 d g d <<g2 b>> a4 g2
\bar "|."
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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
