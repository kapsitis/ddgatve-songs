\version "2.13.16"

%\header {
%    title = "Klīdzamīs bolss"
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
  \key as \major
  \time 4/2
  \autoBeamOff
  \tempo 4=80
  \slurDashed
}

sopMusic = \relative c'' {
  r1 r1 | r4 r4 \tempo 4=60 as4^\markup{Vusas} as8 [f] as4 g f as8 [g] | f4 f8 [g] g4 g as8 [g] f4 es2 \fermata \bar"|."
}

sopWords = \lyricmode {
  ņuo -- mi, la -- pi -- ņuo -- mi, mei -- ti -- ņuo -- mi, la -- pi -- ņuom.
}

%altoMusic = \relative c' {
  
%}

%altoWords = \lyricmode {
%  
%}

tenorMusic = \relative c' {
  es4^\markup{Suoceja} es des c8 [des] es4 c8 [des] es4 es8 [des] | c4 es f^\markup{Vusas} f f es d es | des \glissando bes8 [es] es4 es f8 [es] d4 es2 \fermata
}

tenorWords = \lyricmode {
    \set stanza = "1."
  Ru -- dens ī -- ti, ru -- dens ī -- ti, mei -- ti -- ņuo -- mi, la -- pi -- ņuo -- mi, mei -- ti -- ņuo -- mi, la -- pi -- ņuom.
}

bassMusic = \relative c' {
  r1 r1 | r2 f4 d f es d c | bes bes es es c d es2
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
