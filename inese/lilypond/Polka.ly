\version "2.13.16"

%\header {
%    title = "Garīs bolss"
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
  \time 2/4
  \autoBeamOff
  \tempo 4=120
  \slurDashed
}

sopMusic = \relative c' {
  \repeat volta 3 {
  c8 c e e | c c e e | d d d b | c c c4 | c8 c e e | c c e e |
  d d d b | c c c4 | d8 d d c | b b b b | a a b a | g g g4 | d'8 d d c | b b b b |
  }
  \alternative {
  { a a b a | g g g4 }
  { a8 a b a | g g g4 \bar"|." }
  }
}

sopWords = \lyricmode {
  \set stanza = "1."
  Vī -- tu tai -- su, vī -- tu tai -- su va -- ce -- ja -- mi bruv -- ga -- nom,
  vī -- tu tai -- su, vī -- tu tai -- su va -- ce -- ja -- mi bruv -- ga -- nom;
  div' sou -- ji -- ņas sku -- ju li -- ku, tre -- šū smol -- ku a -- da -- tiņ',
  div' sou -- ji -- ņas sku -- ju li -- ku, tre -- šū smol -- ku a -- da -- tiņ'.
  Tre -- šū smol -- ku a -- da -- tiņ'.
}

%altoMusic = \relative c' {
  
%}

%altoWords = \lyricmode {
%  
%}

tenorMusic = \relative c' {
  \repeat volta 3 {
  c8 c c c |c c c c | b b b b | c c c4 | c8 c c c | c c c c |
  b b b b | c c c4 | d8 d d c | b b b b | 
  a a b a | g g g4 | d'8 d d c | b b b b | 
  }
  \alternative {
  { a a b a | g g g4 }
  { a8 a b a | g g g4 \bar"|." }
  } 
}

tenorWords = \lyricmode {
  \set stanza = "1."
  Vī -- tu tai -- su, vī -- tu tai -- su va -- ce -- ja -- mi bruv -- ga -- nom,
  vī -- tu tai -- su, vī -- tu tai -- su va -- ce -- ja -- mi bruv -- ga -- nom;
  div' sou -- ji -- ņas sku -- ju li -- ku, tre -- šū smol -- ku a -- da -- tiņ',
  div' sou -- ji -- ņas sku -- ju li -- ku, tre -- šū smol -- ku a -- da -- tiņ'.
  Tre -- šū smol -- ku a -- da -- tiņ'.
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
