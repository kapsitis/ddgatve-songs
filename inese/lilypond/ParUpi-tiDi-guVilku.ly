\version "2.13.16"

%\header {
%    title = "Par upīti dīgu vilku"
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
  \key b \major
  \time 4/4
  \tempo 4=72
  \autoBeamOff
  %\slurDashed
}

sopMusic = \relative c' {
  \partial 16
  s16 | b4 dis8 [cis] b4 (cis8) dis | e4 fis b, b | gis' gis fis (e8) dis | cis4 fis b,2  |
  b4 dis8 [cis] b4 (cis8) dis | e4 fis b, b | gis' gis fis (e8) dis | cis4 fis b,2 \bar"|."
}

sopWords = \lyricmode {
  \set stanza = "1. "
  Par u -- pī -- ti dī -- gu vil -- ku, par a -- za -- ru dzij -- pa -- rin'.
  Ai -- rai -- rai -- rai -- rai -- rai -- rai -- rai, par a -- za -- ru dzij -- pa -- rin'.
}

altoMusic = \relative c' {
  \partial 16
  s16 | r2 b4 (ais8) b | cis4 b b b | e e dis (cis8) b | cis4 dis b2 |
  b4 b b (cis8) b | cis4 dis b b | e e dis (cis8) b | cis4 dis b2
}

altoWords = \lyricmode {
  pī -- ti dī -- gu vil -- ku, par a -- za -- ru dzij -- pa -- rin'.
  Ai -- rai -- rai -- rai -- rai -- rai -- rai -- rai, par a -- za -- ru dzij -- pa -- rin'.

}

tenorMusic = \relative c' {
  \oneVoice
  \partial 16
  s16 \bar"" << { r1 | r1 | e4 e8 [b] b4 ( }
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
  b4 b8 a b4 (a8) b | c4 b b b | e e \glissando b
  
}
>>
  cis8) b |  \voiceOne cis4 cis \oneVoice b2 |
  b4 << { b b (cis8) }
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
  b8 [a] b4 (a8)
  
}
>>
  b | cis4 b b b | e e8 [b] b4 (cis8) b |\voiceOne cis4 cis \oneVoice b2
}

tenorWords = \lyricmode {
  par a -- za -- ru dzij -- pa -- rin'.
  Ai -- rai -- rai -- rai -- rai -- rai -- rai -- rai, par a -- za -- ru dzij -- pa -- rin'.

}
bassMusic = \relative c {
  \partial 16
  s16 |  s1 | s1 | s1 | fis4 fis s2 | s1 | s1 | s1 | fis4 fis s
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
