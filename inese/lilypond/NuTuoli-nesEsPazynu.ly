\version "2.13.16"

%\header {
%    title = "Nu tuolīnes es pazynu"
%}
#(set-global-staff-size 19)
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
  \key b \major
  \time 4/4
  \tempo 4=80
  \autoBeamOff
  \slurDashed
}

sopMusic = \relative c' {
  r2 b8 dis fis fis  | cis cis fis fis b, b b4 |
  b8 gis fis fis b dis fis (fis) | cis cis fis (fis) b, b b e |
  e gis b gis fis dis fis4 | ais8 ais ais ais b b b b | 
  gis gis b gis fis dis fis4 | ais8 ais ais ais b b b4 \bar"|."
}

sopWords = \lyricmode {
  es pa -- zy -- nu juo -- na pui -- ša ku -- me -- lin':
  pyl -- na mu -- te smol -- ku dzeļžu, skrīn gaļ_-_vi -- nu grū -- zie -- dams, ai,
  dul -- laj -- dul -- laj -- dul -- laj -- jā, skrīn gaļ -- vi -- nu grū -- zie -- dams, ai,
  dul -- laj -- dul -- laj -- dul -- laj -- jā, skrīn gaļ -- vi -- nu grū -- zie -- dams.
}

altoMusic = \relative c' {
  b8 gis fis fis b dis fis fis | cis cis fis fis b, b b4 |
  b8 gis fis fis b dis fis (fis) | cis cis fis (fis) b, b b e |
  e gis b gis fis dis fis4 | cis8 cis fis fis b, b b e |
  e gis b gis fis dis fis4 | cis8 cis fis fis b, b b4
}

altoWords = \lyricmode {
  \set stanza = "1. "
  Nu tuo -- lī -- nes es pa -- zy -- nu juo -- na pui -- ša ku -- me -- lin':
  pyl -- na mu -- te smol -- ku dzeļžu, skrīn gaļ_-_vi -- nu grū -- zie -- dams, ai,
  dul -- laj -- dul -- laj -- dul -- laj -- jā, skrīn gaļ -- vi -- nu grū -- zie -- dams, ai,
  dul -- laj -- dul -- laj -- dul -- laj -- jā, skrīn gaļ -- vi -- nu grū -- zie -- dams.

}

tenorMusic = \relative c' {
  \oneVoice
  r4 \voiceOne fis,8 fis b b dis dis | cis cis dis dis b b b4 | 
  b8 gis fis fis b dis dis (dis) | cis cis dis dis b  b b b |
  e e e e dis b dis4 | cis8 cis cis cis b b b b |
  e e e e dis b dis4 | cis8 cis cis cis b b b4
}

tenorWords = \lyricmode {
  lī -- nes es pa -- zy -- nu juo -- na pui -- ša ku -- me -- lin':
  pyl -- na mu -- te smol -- ku dzeļžu, skrīn gaļ -- vi -- nu grū -- zie -- dams, ai,
  dul -- laj -- dul -- laj -- dul -- laj -- jā, skrīn gaļ -- vi -- nu grū -- zie -- dams, ai,
  dul -- laj -- dul -- laj -- dul -- laj -- jā, skrīn gaļ -- vi -- nu grū -- zie -- dams.

}
bassMusic = \relative c' {
  s2. b8 b | s1 | s2 s8 b b (b) | fis fis b b s2 |
  s2 s4 b | s8 fis fis fis s2 | s2. b4 | s8 fis fis fis
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
        \voiceOne
        << \global \tenorMusic >>
      }
      \new Voice = "basses" {
        \voiceTwo << \global \bassMusic >>
      }
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
