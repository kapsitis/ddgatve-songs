\version "2.13.16"

%\header {
%    title = "Es māminai vīna meita"
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

%chordsA = \chordmode {
%\germanChords
%\set majorSevenSymbol = \markup { maj7 }
%
%}

global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \tempo 4=96
  \slurDashed
}

sopMusic = \relative c' {
  \partial 16
  s16 \bar""
  fis8 e d b a d d (d) | cis e e e fis e d4 | fis8 e d b a d d (d) | cis e e e fis e d4 |
  a'8 a a a b a a fis | a g g e g fis fis4 | a8 a a a b a a fis | a g g e g fis fis4 \bar"|."
}

sopWords = \lyricmode {
  \set stanza = "1. "
  Es mā -- mi -- nai vī -- na mei-ta, kuo pīrts -- slū -- ta vol -- ko -- vūs.
  Es mā -- mi -- nai vī -- na mei-ta, kuo pīrts -- slū -- ta vol -- ko -- vūs.
  Ni es sprie -- du, ni es uo -- du, ni man juo -- ja pre -- ce -- nīk'.
  Ni es sprie -- du, ni es uo -- du, ni man juo -- ja pre -- ce -- nīk'.
}

altoMusic = \relative c' {
  \partial 16
  s16 \bar""
  r4 d8 b a b b (b) | a cis cis cis d cis d4 | d8 cis d b a b b (b) | a cis cis cis d cis d4 |
  fis8 fis fis fis g fis fis d | fis e e cis e d d4 | fis8 fis fis fis g fis fis d | fis e e cis e d d4  
}

altoWords = \lyricmode {
  mi -- nai vī -- na mei-ta, kuo pīrts -- slū -- ta vol -- ko -- vūs.
  Es mā -- mi -- nai vī -- na mei-ta, kuo pīrts -- slū -- ta vol -- ko -- vūs.
  Ni es sprie -- du, ni es uo -- du, ni man juo -- ja pre -- ce -- nīk'.
  Ni es sprie -- du, ni es uo -- du, ni man juo -- ja pre -- ce -- nīk'.
}

tenorMusic = \relative c' {
  \partial 16
  s16 \bar""

s4 a8 a  

%  << { s4 a8 a }
%\new Staff \with {
%\remove "Time_signature_engraver"
%\remove "Clef_engraver"
%\remove "Key_engraver"
%\remove "Accidental_engraver"
%alignAboveContext = #"main"
%fontSize = #-3
%\override StaffSymbol #'staff-space = #(magstep -3)
%\override StaffSymbol #'thickness = #(magstep -3)
%} { 
%  \key des \major \autoBeamOff
%  fis'8. e16 d8. b16
%  
%}
%>>
  a8 b b (b) | a a a a d cis d4 |
  
d8 cis b b 

%  <<{d8 cis b b}
%\new Staff \with {
%\remove "Time_signature_engraver"
%\remove "Clef_engraver"
%\remove "Key_engraver"
%\remove "Accidental_engraver"
%alignAboveContext = #"main"
%fontSize = #-3
%\override StaffSymbol #'staff-space = #(magstep -3)
%\override StaffSymbol #'thickness = #(magstep -3)
%} { 
%  \key des \major \autoBeamOff
%  d8. cis16 b8. b16
%  
%}
%>>
  a8 b b (b) | a a a a d cis d4 |
  d8 d d d g d d d | d a a a cis d d4 | d8 d d d g fis d d | d a a a cis d d4
}

tenorWords = \lyricmode {
  mi -- nai vī -- na mei-ta, kuo pīrts -- slū -- ta vol -- ko -- vūs.
  Es mā -- mi -- nai vī -- na mei-ta, kuo pīrts -- slū -- ta vol -- ko -- vūs.
  Ni es sprie -- du, ni es uo -- du, ni man juo -- ja pre -- ce -- nīk'.
  Ni es sprie -- du, ni es uo -- du, ni man juo -- ja pre -- ce -- nīk'.  
}
%bassMusic = \relative c' {

%}

fullScore = <<
%\new ChordNames { \chordsA }
\new ChoirStaff <<
    %\new Lyrics = sopranos { s1 }
    \new Staff = women <<
      \new Voice = "sopranos" {
        \oneVoice
        << \global \sopMusic >>
      }
    >>
    \new Lyrics = sopranos { s1 }
    \new Staff = women <<
      \new Voice = "altos" {
        \oneVoice
        << \global \altoMusic >>
      }
    >>
    \new Lyrics = "altos" { s1 }
    %\new Lyrics = "tenors" { s1 }
    \new Staff = men <<
      %\clef bass
      \new Voice = "tenors" {
        \oneVoice
        << \global \tenorMusic >>
      }
      %\new Voice = "basses" {
      %  \voiceTwo << \global \bassMusic >>
      %}
    >>
    \new Lyrics = "tenors" { s1 }
    %\new Lyrics = basses { s1 }    
    \context Lyrics = sopranos \lyricsto sopranos \sopWords
    \context Lyrics = altos \lyricsto altos \altoWords
    \context Lyrics = tenors \lyricsto tenors \tenorWords
    %\context Lyrics = basses \lyricsto basses \bassWords
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
\context { \ChoirStaff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}
