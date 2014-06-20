\version "2.13.16"

%\header {
%    title = "Oi, egle, egle"
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
  \key c \major
  \time 7/4
  \autoBeamOff
  \tempo 4=60
  %\slurDashed
}

sopMusic = \relative c'' {
  \partial 16 s16 \bar""
  r1 r2. | r1 r2. | g2 a4 g f8 [g] e2 | g4. (e8) a4 g f8 [g] e2 \bar"|."
}

sopWords = \lyricmode {
  Oi, ļu -- ļi, ļu -- ļi! Kam na -- za -- ļo -- vi?
}

altoMusic = \relative c' {
  \partial 16 s16 |
  e4. (d8) f4 e d c2 | e4. (d8) f4 e d c2 | e4. (c8) f4 e d8 [e] c2 | c4. (e8) f4 e d8 [e] c2
}

altoWords = \lyricmode {
  \set stanza = "1. "
  Oi, eg -- le, eg -- le, kam na -- za -- ļo -- vi?
  Oi, ļu -- ļi, ļu -- ļi! Kam na -- za -- ļo -- vi?
}

tenorMusic = \relative c' {
  \partial 16 s16 |
  << { r2 }
\new Staff \with {
\remove "Time_signature_engraver"
\remove "Clef_engraver"
\remove "Key_engraver"
\remove "Accidental_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
} { 
  \key des \major \autoBeamOff
  c4. (b8)
}
>>  
  d4 c g c2 | c4. (b8) d4 c << { g c2 | c }
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
%  <<b4 g>> c2 e
%}
>>    
  f4 e d c2 | c f4 e d c2
}

tenorWords = \lyricmode {
  Eg -- le, eg -- le, kam na -- za -- ļo -- vi?
  Oi, ļu -- ļi, ļu -- ļi! Kam na -- za -- ļo -- vi?
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
