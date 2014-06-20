\version "2.13.16"

%\header {
%    title = "Apdzīduošona"
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
  \key a \major
  \time 2/4
  \autoBeamOff
  \tempo 4=80
  \slurDashed
}

sopMusic = \relative c' {
  \partial 16 s16 \bar""
  cis8^\markup{Suoceja} d e8. d16 | e8 d cis cis | cis^\markup{Vusas} d e8. d16 | e8 d cis8. d16 |
  e8 cis b d | cis cis cis d | e cis b d | cis cis cis4 \fermata |
  cis8 d e8. d16 | e8 d cis cis | cis d e8. d16 | e8 d cis d |
  e cis b d | cis cis cis d | e cis b d | cis cis cis4 \fermata \bar"|."
}

sopWords = \lyricmode {
  \set stanza = "1."
  An -- di -- ņa -- i, muo -- si -- ņa -- i, An -- di -- ņa -- i, muo -- si -- ņa -- i, 
  pa vuo -- cus -- ki mo -- ti grīs -- ti, pa vuo -- cus -- ki mo -- ti grīst'.
  Pa vuo -- cus -- ki mo -- ti grīs -- ti, pa vuo -- cus -- ki mo -- ti grīs -- ti,
  ai gruo -- bek -- li sa -- su -- kuo -- ti, ai gruo -- bek -- li sa -- su -- kuot'.
}

%altoMusic = \relative c' {
  
%}

%altoWords = \lyricmode {
%  
%}

tenorMusic = \relative c' {
  \partial 16 s16 |
  << { r2 | r2 | a8 b cis8. b16 }
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
  a8 b c8. b16 | c8 b a a | c d e8. d16
  
}
>>
  cis8 b a8. b16 |
  cis8 a fis b | a a a b | cis a fis b | a a a4 \fermata |
  a8 b cis8. b16 | cis8 b a a | a b cis8. b16 | cis8 b a a |
  cis a gis b | a a a b | cis a gis b | a a a4 \fermata
}

tenorWords = \lyricmode {
  An -- di -- ņa -- i, muo -- si -- ņa -- i, 
  pa vuo -- cus -- ki mo -- ti grīs -- ti, pa vuo -- cus -- ki mo -- ti grīst'.
  Pa vuo -- cus -- ki mo -- ti grīs -- ti, pa vuo -- cus -- ki mo -- ti grīs -- ti,
  ai gruo -- bek -- li sa -- su -- kuo -- ti, ai gruo -- bek -- li sa -- su -- kuot'.  
}

%bassMusic = \relative c' {

%}

% bassWords = \lyricmode {
%  ho ho ho ho
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
      %\new Voice = "altos" {
      %  \voiceTwo
      %  << \global \altoMusic >>
      %}
    >>
    \new Lyrics = "sopranos" { s1 }
    %
    \new Staff = men <<
      %\clef bass
      \new Voice = "tenors" {
        \oneVoice
        << \global \tenorMusic >>
      }
      \new Lyrics = "tenors" { s1 }
      %\new Voice = "basses" {
      %  \voiceTwo << \global \bassMusic >>
      %}
    >>
    %\new Lyrics = basses { s1 }    
    \context Lyrics = sopranos \lyricsto sopranos \sopWords
    %\context Lyrics = altos \lyricsto altos \altoWords
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
