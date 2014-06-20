\version "2.13.16"
%\header {
%    title = "Tālu gan no tevis"
% no kr. "Skani senā dziesma", 28.lpp.
%}
%#(set-global-staff-size 18)
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


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 3/4
\tempo 2.=50
f2 g4 | a2 f4 | d'4 c2~ | c2 r4 |
c4 bes a | g4 f4. g8 | a2.~ | a2 r4 | f2 g4 | 
a2 f4 | d'4 c2~ | c2 r4 | g4 fis g | e'4 d4. g,8 | 
c2.~ | c2 r4 \bar "||" bes2. | a2.~ | a4 f g |
a4 gis a | c4 bes4. a8 | a2. | g2.~ |
g2 r4 | g2. | e2.~ | e4 e f | g4 fis g | 
bes4 a4. g8 | a2.~ | a2.~ | a2 r4
\repeat volta 2 {
d2. | bes2.~ | bes4 bes c | d4 cis d | f4 e4. d8 | d2. | 
c2.~ | c2 r4 | c2. | bes2.~ | bes4 e, f 
}
\alternative { { g4 a4. bes8 | a2.~ | a2.~ | a2.~ | a2 r4 } { g4 f4. e8 | f2.~ | f2.~ |f2.~ | f2 r4 } }
} 

lyricA = \lyricmode {
Tā -- lu kaut no te -- vis, to -- mēr par to ne -- skum -- stu, 
Jo man Dievs ir de -- vis mei -- te -- ni tā -- du kā tu. 
Dzin -- tra, lat -- vju mei -- te -- ne mī -- ļo -- tā, dār -- gā,
Vēs -- ma lai no ma -- nis tev svei -- cie -- nus nes. 
Dzin -- tra, mū -- su mī -- lu lai sirds ta -- va sar -- gā, 
Mā -- jās ka -- mēr pār -- nā -- ku es. 
pār -- nā -- ku es. 
}

chordsA = \chordmode {
\time 4/4
f1.:5 | f1.:5 | c1.:7 | f1.:5 | f1.:5 | f1.:5 | g1.:7 | c2.:5 | c2.:7 |
bes2.:/f | f2.:/c | f1.:1 | c1.:7 | s1. | c1.:7 | s1. | s2. | f1.:5 | s2.
\repeat volta 2 {
c1.:7 | s1. | s2. | f1.:5 | s2. | c1.:7 | s2.
}
\alternative { { c2.:7 | f1.:5 | s1. } { c2.:7 | f1.:5 | s1. } }
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
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


