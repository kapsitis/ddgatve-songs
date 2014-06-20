\version "2.13.16"

%\header {
%    title = "Lai zaļoj jounība"
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
  \key b \major
  \time 5/4
  \autoBeamOff
  \tempo 4=76
  \slurDashed
}

sopMusic = \relative c' {
  b8 dis cis e dis e fis4. fis8 | \time 3/4 gis e dis4. <<fis8 dis>> | e cis b2 |
  \time 5/4 b8 dis cis e dis e fis4. fis8 | \time 3/4 gis e dis4. fis8 |
  \time 4/4 e cis b4. b8 b b | gis' gis gis4. <<b8 gis>> <<b gis>> gis |
  <<b gis>> fis fis4. fis8 fis fis| \time 3/4 ais ais ais4. gis8 | \time 4/4 fis4 e dis2 \bar"|."
}

sopWords = \lyricmode {
  \set stanza = "1. "
  Ka gri -- ba -- ti juvs, tou -- ti -- ņas, ne -- mit ma -- ni šū -- ru -- den.
  Ka gri -- ba -- ti juvs, tou -- ti -- ņas, ne -- mit ma -- ni šū -- ru -- den.v
  Lai za -- ļoj jou -- nī -- ba, lai za -- ļoj jou -- nī -- ba,
  lai za -- ļoj jou -- nī -- ba, lai za -- ļoj tij.
}

altoMusic = \relative c' {
  r1 r4 | r2. | r2. | b8 b ais cis b cis dis4. dis8 | e cis b4. b8 |
  <<cis ais>> ais b4. b8 b b | e e e4. e8 e e | e dis dis4. fis8 fis fis |
  fis fis fis4. e8 | dis4 cis b2 
}

altoWords = \lyricmode {
  Ka gri -- ba -- ti juvs, tou -- ti -- ņas, ne -- mit ma -- ni šū -- ru -- den.v
  Lai za -- ļoj jou -- nī -- ba, lai za -- ļoj jou -- nī -- ba,
  lai za -- ļoj jou -- nī -- ba, lai za -- ļoj tij.
}

tenorMusic = \relative c' {
  r1 r4 | r2. | r2. | b8 b ais << { cis b b }
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
  b8 b a
}
>>
  b4. b8 | e cis b4. b8 |
  fis fis b4. b8 b b | e e e4. e8 e e | e b b4. << { dis8 cis b |
  dis dis dis4. cis8 | b4 ais } 
\new Staff \with {
%\remove "Time_signature_engraver"
\remove "Clef_engraver"
\remove "Key_engraver"
\remove "Accidental_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
} { 
  \key des \major \autoBeamOff
  fis'8 fis dis | dis fis fis4. e8 | dis4 cis
}
>>
  b2
}

tenorWords = \lyricmode {
  Ka gri -- ba -- ti juvs, tou -- ti -- ņas, ne -- mit ma -- ni šū -- ru -- den.v
  Lai za -- ļoj jou -- nī -- ba, lai za -- ļoj jou -- nī -- ba,
  lai za -- ļoj jou -- nī -- ba, lai za -- ļoj tij.
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
