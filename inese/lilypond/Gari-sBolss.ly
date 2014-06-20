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
  \key es \major
  \time 4/4
  \autoBeamOff
  \tempo 4=72
  \slurDashed
}

sopMusic = \relative c'' {
  \repeat volta 4 {
  g4^\markup{Suoceja} as as8 [g] f4 | as8 [g] as4 f \glissando es | es f g8 [f] as4 | f \glissando es^\markup{Vusas} es~ es8 [g] |
  \tempo 4=63
  g8 [f] g4 as g | as8 [g] f4 es (es) | g8 [f] g4 as f | as \glissando g f es | f f8 [g] g4 g
  }
  \alternative {
  { as8 [g] f4 \glissando es2 \fermata }
  { as8 [g] f4 es2 \fermata \glissando \bar"|." }
  }
}

sopWords = \lyricmode {
  \set stanza = "1."
  Na -- dūd, Dī -- vin, šu -- din lī -- ta, šu -- din lī -- ta na -- va -- jag.
  Na -- dūd, Dī -- vin, šu -- din lī -- ta, šu -- din lī -- ta na -- va -- jag, šu -- din lī -- ta na -- va -- jag. na -- va -- jag.
}

%altoMusic = \relative c' {
  
%}

%altoWords = \lyricmode {
%  
%}

tenorMusic = \relative c' {
  \repeat volta 4 {
  r1 | r1 | r1 | r4 r4 es2 |
  es8 [d] es4 f es | f8 [es] d4 es (es) | es8 [d] es4 f f |
  f \glissando es d c | bes bes es es
  }
  \alternative {
  { c4 d es2 \fermata }
  { as8 [g] f4 es2 \fermata \glissando \bar"|." }
  } 
}

tenorWords = \lyricmode {
jag. Na -- dūd, Dī -- vin, šu -- din lī -- ta, šu -- din lī -- ta na -- va -- jag, šu -- din lī -- ta na -- va -- jag. na -- va -- jag.
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
