\version "2.13.16"

%\header {
%    title = "Šuvu, šuvu, varažeju"
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
}

sopMusic = \relative c'' {
  \tempo 4=66
  ges8 f es f16 [es] | des8 es f f | ges f es es | des es f r |
  \tempo 4=108
  es16 es es es es es f f | \time 3/4 es es es es \tempo 4=66 es8 es \glissando des4 \fermata \bar"|."
}

sopWords = \lyricmode {
  \set stanza = "1. "
  Šu -- vu, šu -- vu, va -- ra -- že -- ju, kaļ -- ni -- nā -- i stā -- vā -- dam'.
  Šu -- vu, šu -- vu, va -- ra -- že -- ju, kaļ -- ni -- nā -- i stā -- vā -- dam'.
}

altoMusic = \relative c'' {
  ges8 f es es | des es f f | ges f es es | des es f r |
  c16 c c c c as des des | \time 3/4 c c c c as8 as des4 \fermata
}

altoWords = \lyricmode {
  \set stanza = "1. "
  Šu -- vu, šu -- vu, va -- ra -- že -- ju, kaļ -- ni -- nā -- i stā -- vā -- dam'.
  Šu -- vu, šu -- vu, va -- ra -- že -- ju, kaļ -- ni -- nā -- i stā -- vā -- dam'.
}

tenorMusic = \relative c'' {
  ges8 f es es | des c des des | es des c as | des es f r |
  as,16 as as as as as des des | \time 3/4 c c c bes as8 as des4 \fermata
}

tenorWords = \lyricmode {
  \set stanza = "1. "
  Šu -- vu, šu -- vu, va -- ra -- že -- ju, kaļ -- ni -- nā -- i stā -- vā -- dam'.
  Šu -- vu, šu -- vu, va -- ra -- že -- ju, kaļ -- ni -- nā -- i stā -- vā -- dam'.
}


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
