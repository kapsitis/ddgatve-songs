\version "2.13.16"

%\header {
%    title = "Voi, Dīvin, Dīvam žāļ"
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
  \key e \major
  \time 4/4
  \autoBeamOff
  \tempo 4=88
}

sopMusic = \relative c' {
  \partial 16
  s16 \bar""
  e8 e e e e dis cis b | e dis cis b cis b b b | gis8. b16 b8 b gis'8. gis16 gis8 gis |
  a8. fis16 fis8 fis e e e4 | b8. a16 gis8 b gis'8. gis16 gis8 gis | a8. fis16 fis8 fis e e e4 \bar"|."
}

sopWords = \lyricmode {
  \set stanza = "1. "
  Voi, Dī -- vi -- ni, Dī -- vam žāļ i gruvts juo -- na -- mi pui -- sā -- na -- mi,
  trā -- di -- ram -- sam, trā -- di -- ram -- sam, trā -- di -- ram -- sam ej ar man'!
  Trā -- di -- ram -- sam, trā -- di -- ram -- sam, trā -- di -- ram -- sam ej ar man'! 
}

altoMusic = \relative c' {
  \partial 16
  s16 \bar""
  e8 e e e e dis cis b | e dis cis b cis b b b | gis8. b16 b8 b e8. e16 e8 e |
  fis8. dis16 dis8 dis e e e4 | b8. a16 gis8 b e8. e16 e8 e | fis8. dis16 dis8 dis e e e4
  
}

altoWords = \lyricmode {
  \set stanza = "1. "
  Voi, Dī -- vi -- ni, Dī -- vam žāļ i gruvts juo -- na -- mi pui -- sā -- na -- mi,
  trā -- di -- ram -- sam, trā -- di -- ram -- sam, trā -- di -- ram -- sam ej ar man'!
  Trā -- di -- ram -- sam, trā -- di -- ram -- sam, trā -- di -- ram -- sam ej ar man'!
}

tenorMusic = \relative c' {
  \partial 16
  s16 \bar""
  << { e8 e e e e dis cis b | e dis }
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
  c8 c c c c b c b | c b
  
}
>>
  cis b cis b b b | gis8. b16 b8 b e8. e16 e8 cis |
  b8. b16 b8 b e e e4 | b8. a16 gis8 b e8. e16 e8 cis | b8. b16 b8 b e e e4
}

tenorWords = \lyricmode {
  \set stanza = "1. "
  Voi, Dī -- vi -- ni, Dī -- vam žāļ i gruvts juo -- na -- mi pui -- sā -- na -- mi,
  trā -- di -- ram -- sam, trā -- di -- ram -- sam, trā -- di -- ram -- sam ej ar man'!
  Trā -- di -- ram -- sam, trā -- di -- ram -- sam, trā -- di -- ram -- sam ej ar man'!  
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
        \voiceOne
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
