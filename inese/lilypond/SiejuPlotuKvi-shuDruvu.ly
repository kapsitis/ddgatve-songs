\version "2.13.16"

%\header {
%    title = "Sieju plotu kvīšu druvu"
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
  \tempo 4=92
  \slurDashed
}

sopMusic = \relative c' {
  \partial 16 s16 \bar""
  fis8 e d b a b a (a) | a g' g g fis2 | fis8 e d b a b a4 | a8 g' g g fis4. fis8 | e4. fis8 e4. e8 |
  e e fis gis a4 a8^> r | a, a d d fis fis a4 | g8 g g g fis2 | a,8 a d d fis fis a4 | g8 g g g fis2 \bar"|."
}

sopWords = \lyricmode {
  \set stanza = "1. "
  Sie -- ju plo -- tu kvī -- šu druvu, jo -- hai -- di -- ai -- dā,
  pi a -- za -- ra kaļ -- ni -- ņā, jo -- hai -- di -- ai -- dā.
  Fol -- drī, fol -- drā, fol -- frī -- ai -- di -- ai -- dā, heu!
  Di -- ai -- di -- ai -- di -- ai -- dā, jo -- hai -- di -- ai -- dā!
  Di -- ai -- di -- ai -- di -- ai -- dā, jo -- hai -- di -- ai -- dā!
}

altoMusic = \relative c' {
  \partial 16 s16 |
  r2 a8 b a (a) | a e' e e d2 | d8 cis d b a b a4 | a8 e' e <<e cis>> d4. d8 | cis4. d8 a4. a8 |
  a a b cis d4 d8^> r | a a d d d d fis4 | e8 e e e d2 | a8 a d d d d fis4 | e8 e e e d2 
}

altoWords = \lyricmode {
  kvī -- šu druvu, jo -- hai -- di -- ai -- dā,
  pi a -- za -- ra kaļ -- ni -- ņā, jo -- hai -- di -- ai -- dā.
  Fol -- drī, fol -- drā, fol -- frī -- ai -- di -- ai -- dā, heu!
  Di -- ai -- di -- ai -- di -- ai -- dā, jo -- hai -- di -- ai -- dā!
  Di -- ai -- di -- ai -- di -- ai -- dā, jo -- hai -- di -- ai -- dā!
}

tenorMusic = \relative c' {
  \partial 16 s16 |
  << { r2 a8 b a (a) | a a a a }
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
  d8 c b b a a a (a) | a a b c
}
>> 
  d2 | d8 cis d b a b a4 | a8 a a a d4. a8 | a4. b8 a4. a8 |
  a a b cis d4 d8^> r | a a d d d d d4 | e8 << { e cis }
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
  cis <<cis a>>
}
>>  
  <<cis a>> d2 | a8 a d d d d d4 | e8 cis <<cis a>> <<cis a>> d2
}

tenorWords = \lyricmode {
  kvī -- šu druvu, jo -- hai -- di -- ai -- dā,
  pi a -- za -- ra kaļ -- ni -- ņā, jo -- hai -- di -- ai -- dā.
  Fol -- drī, fol -- drā, fol -- frī -- ai -- di -- ai -- dā, heu!
  Di -- ai -- di -- ai -- di -- ai -- dā, jo -- hai -- di -- ai -- dā!
  Di -- ai -- di -- ai -- di -- ai -- dā, jo -- hai -- di -- ai -- dā!
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
