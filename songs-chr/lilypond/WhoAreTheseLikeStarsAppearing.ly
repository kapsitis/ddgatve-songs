\version "2.13.16"
%\header {
%    title = "Who are these like stars appearing"
%}
%http://www.geoffhorton.com/hymns/indexbytitle.html
#(set-global-staff-size 16)
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

\include "english.ly"

world = {
  \key bf \major
  \time 4/2
}

voiceA = \relative c'' {
  \tempo 2=96
  \clef "treble"
  \world
  bf2 f g g |
  f2. ef4 d2 bf |
  f' g4( a) bf2 a |
  g g f1 |
  bf2 f g g |
  f2. ef4 d2 bf |
  f' g4( a) bf2 a |
  g g f1 |
  c'2 c c bf4( c) |
  d2 c4( bf) c1 |
  bf2 f g4( a) bf2 |
  c c bf1 \bar "|."
}


voiceB = \relative c' {
  \clef "treble"
  \world
  d2 f ef ef |
  c c bf bf |
  f' f e f |
  f e f1 |
  f2 d ef ef |
  c c bf bf |
  c c c c |
  c2. bf4 a1 |
  f'2 e f f |
  f f f1 |
  f2 d ef f |
  g f4( ef) d1 |
}

voiceC = \relative c' {
  \clef "bass"
  \world
  bf2 bf bf c |
  c a bf bf |
  d c c c |
  d c a1 |
  bf2 bf bf c | 
  a f f d |
  d d e d |
  d e f1 |
  a2 g a bf4( a) |
  bf2 bf a1 |
  bf2 bf bf bf |
  bf a bf1 \bar "|."
}

voiceD = \relative c {
  \clef "bass"
  \world
  bf2 d ef c |
  a f bf bf |
  bf' a g f |
  bf, c f1 |
  d2 bf ef c |
  f a, bf bf |
  a a g a4( bf) |
  c2 c f1 |
  f2 c f d4( c) |
  bf2 d f1 |
  d2 bf ef d |
  ef f bf,1
}

lyricA = \lyricmode {
  \set stanza = "1. "
  Who are these like stars ap -- pear -- ing,
  These, be -- fore God's throne who stand?
  Each a gold -- en crown is wear -- ing;
  Who are all this glo -- rious band?
  Al -- le -- lu -- ia! Hark, they sing,
  Prais -- ing loud their heav'n -- ly King.
}

fullScore = <<
\new ChoirStaff <<
\new Staff = "upper" {<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
>>}
\new Lyrics \lyricsto "voiceA" \lyricA
\new Staff = "lower" {<<
\new Voice = "voiceC" { \voiceThree \autoBeamOff \voiceC }
\new Voice = "voiceD" { \voiceFour \autoBeamOff \voiceD }
>>}
>>
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


