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
  \key bes \major
  \time 6/8
  \autoBeamOff
  \tempo 4=132
  \slurDashed
}

sopMusic = \relative c' {
  %\partial 16 s16 \bar""
  f8 f g f d4 | es8 f es d d4 | f8 f g f d4 | es8 f es d d4 |
  es8 es es d d4 | es8 c c d d d | es es es d d4 | es8 c c bes bes bes \bar"|."
}

sopWords = \lyricmode {
  \set stanza = "1."
  Ī -- kry -- ta Ju -- rīts ruo -- ce -- ņu dū -- bie; 
  ī -- kry -- ta Ju -- rīts ruo -- ce -- ņu dū -- bie; 
  An -- nī -- te ap -- leik, klīk -- da -- ma, rāk -- da -- ma;
  An -- nī -- te ap -- leik, klīk -- da -- ma, rāk -- da -- ma.
}

%altoMusic = \relative c' {
  
%}

%altoWords = \lyricmode {
%  
%}

tenorMusic = \relative c' {
  %\partial 16 s16 | 
  \oneVoice r8 << { r8 r2 | r2 \voiceOne bes4 | d8 d es d bes4 } 
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
  bes8 es d4 bes8 | c d c bes4 bes8
}
>>
  c8 d c bes bes4 |
  c8 c c bes bes4 | c8 a a bes bes bes | c c c bes bes4 | c8 a a bes bes bes
}

tenorWords = \lyricmode {
  bie; 
  ī -- kry -- ta Ju -- rīts ruo -- ce -- ņu dū -- bie;
  An -- nī -- te ap -- leik, klīk -- da -- ma, rāk -- da -- ma;
  An -- nī -- te ap -- leik, klīk -- da -- ma, rāk -- da -- ma.
}

bassMusic = \relative c' {
  s2. | s2. | bes8 bes s2 | s8 bes s2 |
  s4 a8 s4. | s2. | s2. | s8 f f s4.
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
