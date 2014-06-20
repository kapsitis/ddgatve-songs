\version "2.13.16"

%\header {
%    title = "Dzārojs puika bādovāsi"
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
  \time 6/8
  \autoBeamOff
  \tempo 4=56
  \slurDashed
}

sopMusic = \relative c' {
  \partial 16
  s16 |
  fis4 fis8 e [fis] e | d4 fis8 a [g] fis | e4 e8 g [fis] e | d4 d8 d4 e8 |
  fis4 fis8 e [fis] e | d4 fis8 a [g] fis | e4 e8 g [fis] e | d4 d8 d4 d8 \glissando |
  b4 b8 d [cis] b | a4 << fis'8 d >> fis4 fis8 | e4 e8 g [fis] e | d4 d8 d4 d8 \glissando |
  b4 b8 d [cis] b | a4 << fis'8 d >> fis4 fis8 | e4 e8 g [fis] e | d4 d8 d4. \bar"|."
}

sopWords = \lyricmode {
  \set stanza = "1. "
  Dzā -- rojs pui -- ka bā -- do -- vā -- si, kur buvs nem -- ti lij -- ga -- vi -- nu.
  Dzā -- rojs pui -- ka bā -- do -- vā -- si, kur buvs nem -- ti lij -- ga -- vi -- nu.
  Bol -- ta pu -- če a -- za -- rā -- i, tij dzā -- ro -- ja lij -- ga -- vi -- na,
  bol -- ta pu -- če a -- za -- rā -- i, tij dzā -- ro -- ja lij -- ga -- vin'.
}

altoMusic = \relative c' {
  \partial 16
  s16 \bar""

r2.
  
%  << { r2.}
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
%  d4 d8 c [d] c
%}
%>>
  d4 d8 fis [e] d | cis4 cis8 e [d] cis | d4 d8 d4 cis8 |
  d4 d8 cis [d] cis | d4 d8 fis [e] d |  cis4 cis8 e [d] cis | d4 d8 d4 d8 \glissando |
  b4 b8 d8 [cis] b | a4 a8 d4 d8 | cis4 cis8 e [d] cis | d4 d8 d4 d8 \glissando |
  b4 b8 d8 [cis] b | a4 a8 d4 d8 | cis4 cis8 e [d] cis | d4 d8 d4.
}

altoWords = \lyricmode {
  bā -- do -- vā -- si, kur buvs nem -- ti lij -- ga -- vi -- nu.
  Dzā -- rojs pui -- ka bā -- do -- vā -- si, kur buvs nem -- ti lij -- ga -- vi -- nu.
  Bol -- ta pu -- če a -- za -- rā -- i, tij dzā -- ro -- ja lij -- ga -- vi -- na,
  bol -- ta pu -- če a -- za -- rā -- i, tij dzā -- ro -- ja lij -- ga -- vin'.
}

tenorMusic = \relative c' {
  \partial 16
  s16 |
  r4. a8 [d] cis | d4 d8 d4 d8 | a4 a8 a [b] cis | d4 d8 d4 a8 |
  d4 d8 a [d] cis | d4 d8 d4 d8 | a4 a8 a [b] a | d4 d8 d4 d8 |
b4 b8 b [a]
%  << { b4 b8 b [a] }
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
%  g4 g8 g4
%}
%>>
  g8 | a4 a8 d4 d8 | a4 a8 a [b] cis | d4 d8 d4 d8 |
  g,4 g8 

b [a] 
%<< { b [a] }
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
%  g,4
%}
%>>
  g8 | a4 a8 d4 d8 | a4 a8 e' [d] cis | d4 d8 d4.
}

tenorWords = \lyricmode {
  pui -- ka bā -- do -- vā -- si, kur buvs nem -- ti lij -- ga -- vi -- nu.
  Dzā -- rojs pui -- ka bā -- do -- vā -- si, kur buvs nem -- ti lij -- ga -- vi -- nu.
  Bol -- ta pu -- če a -- za -- rā -- i, tij dzā -- ro -- ja lij -- ga -- vi -- na,
  bol -- ta pu -- če a -- za -- rā -- i, tij dzā -- ro -- ja lij -- ga -- vin'.
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
