\version "2.13.16"

%\header {
%    title = "Vusi vieji mani puvta"
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
  \tempo 4=72
}

sopMusic = \relative c' {
  des4 ges f4. es8 | des es f4 des2 | des4 bes' as4. ges8 | f ges as4 \glissando f2 |
  bes8 bes bes << bes ges  >> as as bes as | ges ges as ges f f f4 | bes8 bes bes << bes ges >> as as bes as | ges ges as ges f f f4 \fermata \bar"|."
}

sopWords = \lyricmode {
  \set stanza = "1. "
  Vu -- si vie -- ji ma -- ni puv -- ta, vu -- si vie -- ji ma -- ni puv -- ta,
  vu -- si vie -- ji ma -- ni puv -- ta, Vu -- si ļouds i ap -- ru -- nov'.
  Vu -- si vie -- ji ma -- ni puv -- ta, Vu -- si ļouds i ap -- ru -- nov'.  
}

altoMusic = \relative c' {
  r1 | des8 es f4 des2 | des4 ges f4. es8 | des es f4 des2 |
  ges8 ges ges <<ges es>> f f ges f | es es f es des des des4 | ges8 ges ges <<ges es>> f f ges f | es es f es des des des4 \fermata
}

altoWords = \lyricmode {
  ma -- ni puv -- ta, vu -- si vie -- ji ma -- ni puv -- ta,
  vu -- si vie -- ji ma -- ni puv -- ta, Vu -- si ļouds i ap -- ru -- nov'.
  Vu -- si vie -- ji ma -- ni puv -- ta, Vu -- si ļouds i ap -- ru -- nov'.
}

tenorMusic = \relative c' {
  r2 des4. as8 | des c des4 des2 | des4 ges des4. es8 | des <<c as>> des4 des2 |
  ges8 ges ges des des des des des | as as des c des des des4 | ges8 ges ges des des des ges f | es es des c des des des4 \fermata
}

tenorWords = \lyricmode {
  vie -- ji ma -- ni puv -- ta, vu -- si vie -- ji ma -- ni puv -- ta,
  vu -- si vie -- ji ma -- ni puv -- ta, Vu -- si ļouds i ap -- ru -- nov'.
  Vu -- si vie -- ji ma -- ni puv -- ta, Vu -- si ļouds i ap -- ru -- nov'.  
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
