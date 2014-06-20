\version "2.13.16"

%\header {
%    title = "Puori broucu azarami"
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
  \key des \major
  \time 4/4
  \autoBeamOff
  \tempo 4=92
  \slurDashed
}

sopMusic = \relative c' {
  \partial 16 s16 \bar""
  f4. es8 des des c des | \time 2/4 es4 as, | \time 4/4 f'4. es8 des des c des |
  \time 2/4 es4 as, | f'8 f as f | es es es es |
  bes bes es es | as, as as (as) | f' f as f | es es es es | bes bes es es | as, as as (as) \bar"|."
}

sopWords = \lyricmode {
  \set stanza = "1."
  Puo -- ri brou -- cu a -- za -- ra -- mi, 
  puo -- ri brou -- cu a -- za -- ra -- mi, 
  puo -- ri brou -- cu a -- za -- ra -- mi, 
  sa -- so -- lu -- šam, na -- so -- lu-šam, 
  puo -- ri brou -- cu a -- za -- ra -- mi, 
  sa -- so -- lu -- šam, na -- so -- lu-šam.
}

%altoMusic = \relative c' {
  
%}

%altoWords = \lyricmode {
%  
%}

tenorMusic = \relative c' {
  \partial 16 s16 | 
  << { \oneVoice r2 \voiceOne }
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
  d4. c8
}
>>
  \oneVoice des8 bes as bes | c4 as | des4. c8 bes bes as bes | c4 as | des8 des des des |  c c des c |
  bes bes c c | as as as (as) | des des des des | c c des c | bes bes c c | as as as (as)
}

tenorWords = \lyricmode {
  brou -- cu a -- za -- ra -- mi, 
  puo -- ri brou -- cu a -- za -- ra -- mi, 
  puo -- ri brou -- cu a -- za -- ra -- mi, 
  sa -- so -- lu -- šam, na -- so -- lu-šam, 
  puo -- ri brou -- cu a -- za -- ra -- mi, 
  sa -- so -- lu -- šam, na -- so -- lu-šam.
}

bassMusic = \relative c' {
  \partial 16
  s16 | s1 | as4 s4 | s1 | as4 s 
}

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
        \voiceOne
        << \global \tenorMusic >>
      }
      \new Lyrics = "tenors" { s1 }
      \new Voice = "basses" {
        \voiceTwo << \global \bassMusic >>
      }
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
