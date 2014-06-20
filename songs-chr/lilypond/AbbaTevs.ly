\version "2.13.16"
%\header {
%    title = "Abba - Tēvs"
%}
% http://www.katolis.lv/majori/notis.htm
% http://www.spiewnik.fogi.pl/teksty/626,abba_ojcze
% http://www.esims.pl/wojtek/spiewnik/index.php?go=spiewnik_Bog
\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.3\cm
between-system-space = 0.3\cm
}
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key c \major
\time 4/4
g'4 g8 g a4 a8 a8 | \slurDashed g4.( f8) g2 | \slurSolid g4 g8 g f( e) d( c) | \slurDashed d4.( g8) g4 r8 g | 
e4 e e fis8 gis | a4.( b8) c4. a8 | g4 g8 g f8[( e]) d c | d4.( g8) g2 
\repeat volta 2 { 
e2 f | \slurSolid e4( d8[ c]) d2 | e2 f | e4( g8[ e]) d2 | g2( gis4 a8) b | c4.( b8) c4 c8 d | e4( d8[ c] d4. c8) | c2 r2 
} 
}



lyricAA = \lyricmode {
\set stanza = #"1. "
Kungs, Tu mūs da -- rī -- ji brī -- vus, Tu mū -- su va -- žas no-ņē -- mi, 
un Kris -- tus kļū -- dams mums brā -- lis, mūs mā -- cī -- ja vien-mēr saukt uz Te -- vi:
Ab -- ba, mū-su Tēvs, Ab -- ba, mū-su Tēvs, Ab -- ba, mū-su Tēvs, Ab -- ba mū-su Tēvs!
}

lyricAB = \lyricmode {
\override StanzaNumber #'font-shape = #'italic
\set stanza = #"1. "
\override LyricText #'font-shape = #'italic
Ty wy -- zwo -- li -- łeś nas Pa -- nie
Z_kaj -- dan i sa -- mych sie -- bie
A Chrys -- tus sta -- jąc się bra -- tem
Na -- u -- czył nas wo -- łać do Cie -- bie:
Ab -- ba Oj -- cze! Ab -- ba Oj -- cze! Ab -- ba Oj -- cze! Ab -- ba Oj -- cze!
}


chordsA = \chordmode {
\time 4/4 c2:5 f2:5 | g2:5 c2:5 | e2:m f2:5 | g2:sus4 g2:5 | 
e2:sus4 e2:7 | a2:m f2:5 | c2:5 f2:5 | g2:sus4 g2:7 
\repeat volta 2 {
c2:5 f2:5 | c2:5 g2:5 | c2:5 f2:5 | c2:5 g2:5 | 
c2:5 e2:5 | a2:m f2:5 | c2:5 g2:7 | c2:5 g2:5 
}
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricAA
\lyricsto "voiceA" \new Lyrics \lyricAB
>>
}
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
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}


