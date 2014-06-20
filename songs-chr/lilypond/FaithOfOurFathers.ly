\version "2.13.16"
\include "english.ly"

%\header {
%    title = "Abide with me"
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

voiceA = \relative c'' {
  \clef "treble"  
  \key g \major
  \time 3/4  
  b4 a g |
  g( fs) g |
  a( e) fs |
  g2. |
  g4 fs e | 
  d2 g4 |
  g( fs) g |
  a2. |
  b4 a g |
  g( fs) g |
  a( e) fs |
  g2. |
  g4 fs e |
  d2 b'4 | 
  a( b) a |
  g2. |
  c4^\markup { \small \italic "Refrain" } c c |
  b2 b4 |
  a2 a4 |
  b2. | 
  b4 a g |
  e2 g4 |
  a2 a4 |
  g2. \bar "|."
}


voiceB = \relative c' {
  \clef "treble"  
  \key g \major
  \time 3/4
  d4 d d |
  d2 d4 |
  e2 d4 |
  d2. |
  e4 d c |
  b2 d4 |
  cs2 cs4 |
  d2. |
  d4 d d |
  d2 d4 |
  e2 d4 |
  b2. |
  e4 d c |
  b2 d4 |
  e2 c4 |
  b2. |
  g'4 g g |
  g2 g4 |
  g2 fs4 |
  g2. |
  b,4 c d | 
  c2 b4 |
  d2 d4 |
  b2.
}

voiceC = \relative c' {
  \clef "bass"  
  \key g \major
  \time 3/4
  d4 c b |
  b( c) b |
  c2 a4 |
  b2. |
  g4 g g |
  b2 b4 |
  g2 g4 |
  fs2. |
  g4 c b |
  b( a) g |
  c2 a4 |
  g2. |
  g4 g g |
  g2 g4 | 
  g2 fs4 |
  g2. |
  c4 e c |
  d2 d4 |
  d2 d4 | 
  d2. |
  g,4 g g |
  g2 g4 |
  g2 fs4 |
  g2.
}

voiceD = \relative c' {
  \clef "bass"  
  \key g \major
  \time 3/4
  g4 g g |
  g( a) g |
  c,2 d4 |
  g,2. |
  c4 c e |
  g2 g4 |
  e2 e4 |
  d2. |
  g4 g g |
  d( c) b |
  a2 d4 |
  e2. |
  c4 c e |
  g2 b,4 |
  c2 d4 |
  g2. |
  e4 c e |
  g2 g4 |
  d2 d4 |
  g2. |
  g,4 a b |
  c2 e4 |
  d2 d4 |
  g,2.
}

lyricA = \lyricmode {
  \set stanza = "1. " Faith of our fa -- thers! liv -- ing still
  in spite of dun -- geon, fire and sword.
  O how our hearts beat high with joy,
  when -- e'er we hear that glo -- rious word:
  Faith of our fa -- thers, ho -- ly faith!
  We will be true to thee till death.
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


