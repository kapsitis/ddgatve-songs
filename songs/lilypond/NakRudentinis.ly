\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Nāk rudentiņis"
%}
% Austras dziesmu burtnīca, 24.lpp.
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
\key a \major
\time 3/4
a4 cis4. cis8 | cis4 b r | b4 d4. d8 | d4 cis r | 
a4 cis e | e4 d8[ cis] b4 | fis'4 e4. gis,8 | b4 a r | 
a4 a'4. a8 | a4 fis r | d4 fis4. a8 | a4 e r | 
cis4 a cis | fis4 e cis | fis4 e4. gis,8 | b4 a r 
\bar "|." 
}


lyricA = \lyricmode {
Nāk ru -- den -- ti -- ņis, būs bar -- ga zie -- ma,
grib mū -- su bā -- le -- liņš lī -- ga -- vu ņem -- ti; 
Nāk ru -- den -- ti -- ņis, būs bar -- ga zie -- ma, 
grib mū -- su bā -- le -- liņš lī -- ga -- vu ņem -- ti. 
}


chordsA = \chordmode {
\time 3/4 
a2.:5 | e2.:5 | e2.:7 | a2.:5 | fis2.:m | b2.:m | e2.:7 | a2.:5 |
a2.:7 | d2.:5 | s2. | a2.:5 | fis2.:m | b2.:m | e2.:7 | a2.:5
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
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


