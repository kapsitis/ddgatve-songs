\version "2.13.16"

%\header {
%    title = "Eima, eima mes, muosiņas"
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
  \time 2/4
  \autoBeamOff
  \tempo 4=69
}

sopMusic = \relative c' {
  \slurDashed
  des8 (des) des as | des (des) des (es) | f f f es \slurNeutral | des4 (f8) \slurDashed f |
  es (es) es des | c (bes) as (as) | es' es f es | des4 (des) \bar"|."
}

sopWords = \lyricmode {
  \set stanza = "1. "
  Ei-ma, ei -- ma, mes,muo -- si-ņas pa u -- pī -- tes mo -- lu,
  Ei-ma, ei -- ma, mes,muo -- si-ņas pa u -- pī -- tes mo-lu.
}

altoMusic = \relative c' {
  \slurDashed
  r4 r8 as | des (des) des (c) | des des des c | des4. des8 |
  c (c) c bes | as (g) as (as) | c c des c | des4 (des)
}

altoWords = \lyricmode {
  ma, mes,muo -- si-ņas pa u -- pī -- tes mo -- lu,
  Ei-ma, ei -- ma, mes,muo -- si-ņas pa u -- pī -- tes mo-lu.
}

tenorMusic = \relative c' {
  \oneVoice
  \slurDashed
  r2 | bes8 (bes) bes (as) | des des des c | des4. des8 |
  c (c) c bes | as (g) as (as) | as as as as | des4 (des)
}

tenorWords = \lyricmode {
  mes,muo -- si-ņas pa u -- pī -- tes mo -- lu,
  Ei-ma, ei -- ma, mes,muo -- si-ņas pa u -- pī -- tes mo-lu.
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
