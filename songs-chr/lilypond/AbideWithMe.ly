\version "2.13.16"
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

\include "english.ly"

voiceA = \relative c'' {
  \clef "treble"  
  \key ef \major
  \time 4/4
  g2 g4 f | 
  ef2 bf' | 
  c4 bf bf af |
  g1 |
  g2 af4 bf |
  c2 bf |
  af4 f g a |
  bf1 |
  g2 g4 f |
  ef2 bf' | 
  bf4 af af g |
  f1 |
  f2 g4 af |
  g f ef af |
  g2 f | 
  ef1 \bar "|."
}


voiceB = \relative c' {
  \clef "treble"  
  \key ef \major
  \time 4/4
  ef2 d4 d |
  ef2 ef |
  ef4 d ef f |
  ef1 |
  ef2 ef4 ef |
  ef2 ef |
  ef4 f ef ef |
  d1 |
  ef2 d4 d | 
  ef2 ef |
  ef4 ef e e |
  f1 |
  d2 ef4 d |
  ef d ef f |
  ef2 d |
  ef1
}

voiceC = \relative c' {
  \clef "bass" 
  \key ef \major
  \time 4/4
  bf2 bf4 af |
  g2 ef |
  ef4 bf' bf bf |
  bf1 |
  bf2 af4 g |
  af2 g |
  c4 bf bf ef, |
  f1 |
  g4( af) bf af |
  g2 ef'4( d) |
  c4 c c bf |
  af1 |
  bf2 bf4 bf |
  bf af g c |
  bf2. af4 |
  g1
}

voiceD = \relative c {
  \clef "bass"  
  \key ef \major
  \time 4/4
  ef2 bf4 bf |
  c2 g |
  af4 bf c d |
  ef1 |
  ef4( d) c bf |
  af2 ef' |
  f4 d ef c |
  bf1 |
  ef2 bf4 bf |
  c2 g |
  af4. bf8 c4 c |
  f1 |
  af2 g4 f |
  ef bf c af |
  bf2 bf |
  ef1
}

lyricA = \lyricmode {
  \set stanza = "1. "
  A -- bide with me: fast falls the e -- ven -- tide;
  The dark -- ness deep -- ens; Lord, with me a -- bide:
  When oth -- er help -- ers fail and com -- forts flee,
  Help of the help -- less, O a -- bide with me.
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
\markup { \with-color #(x11-color 'white) \sans \smaller  "__" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}




