\version "2.13.16"

%\header {
%    title = "Kur tu juosi, šmuks puisīti"
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
  \time 3/4
  \autoBeamOff
}

sopMusic = \relative c' {
  \tempo 4=72
  \partial 16*1
  s16 \bar ""
  des4 f4 f8 des | es4 ges ges8 es | f4 as as8 as | \time 4/4 bes4 as as4. \glissando f8 |
  \time 3/4 ges4 bes bes8 ges | f4 as as8 f | es4 as c8 bes | \time 4/4 as4 ges f2 \bar"|."
}

sopWords = \lyricmode {
  \set stanza = "1. "
  Kur tu juo -- si, šmuks pui -- sī -- ti tym -- se -- jā -- i vo -- ka -- rā -- i?
  Kur tu juo -- si, šmuks pui -- sī -- ti tym -- se -- jā -- i vo -- ka -- rā?
}

altoMusic = \relative c' {
  \partial 16*1
  s16 \bar ""
  << { r2. }
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
  d4 d d8 d
  
}
>>
  c4 es es8 c | des4 f f8 f | ges4 f f4. des8 | 
  es4 ges ges8 es | des4 f f8 des | es4 as as8 ges | f4 es des2
}

altoWords = \lyricmode {
  šmuks pui -- sī -- ti tym -- se -- jā -- i vo -- ka -- rā -- i?
  Kur tu juo -- si, šmuks pui -- sī -- ti tym -- se -- jā -- i vo -- ka -- rā?
}

tenorMusic = \relative c' {
  \partial 16*1
  s16 \bar ""
  \oneVoice r2 r8 \voiceOne bes | as4 es' es8 c | des4 des des8 des | ges4 des des4. as8 |
  es'4 ges ges8 es | des4 des des8 des | c4 f f8 es | des4 es des2
}

tenorWords = \lyricmode {
  si, šmuks pui -- sī -- ti tym -- se -- jā -- i vo -- ka -- rā -- i?
  Kur tu juo -- si, šmuks pui -- sī -- ti tym -- se -- jā -- i vo -- ka -- rā?
}
bassMusic = \relative c' {
  s16 | s2. | s | s | s1 | s2. | s2 s8 bes | as4 des s4 | s4 c
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
