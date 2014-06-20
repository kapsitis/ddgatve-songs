\version "2.13.16"
%\header {
%    title = "Dzīd, trolloj mežs"
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


voiceA = \relative c' {
\clef "treble"
\key f \major
\time 4/4
\partial 8*1
c8 | a'8 g16[ a] f4. d8 e f | g8 f16[ g] e4. r4 c8 | bes'8 a16[ bes] g4. e8 f g | a8 g16[ a] f4. 
\repeat volta 2 {
f8 g f |
d'8 c16[ d] bes4. bes8 c d | d8 c a4. c,8 d c | bes'8  a16[ bes] g4. g8 a bes | a8 g16[ a] f4. 
}
} 

lyricA = \lyricmode {
\set stanza = #"1." Dzīd, tral -- loj mežs, i ak -- miņs ga -- vi -- lej 
Dzīd, trol -- loj mežs, i ak -- miņs ga -- vi -- lej 
}

lyricB = \lyricmode {
\set stanza = #"2." 
Brīst ru -- dzi tei -- ru -- mā i grī -- ze grīž. 
Brīst ru -- dzi tei -- ru -- mā i grī -- ze grīž. 
Tik skaid -- ra vo -- lū -- da, tik skaid -- ra vo -- lū -- da, 
Kai yu -- diņs o -- lū -- tā, tik skaid -- rā o -- lū -- tā.
}

lyricC = \lyricmode {
\set stanza = #"3." 
Ar myu -- sim Tāv -- ze -- me tai ru -- no -- jās.
Ar myu -- sim Tāv -- ze -- me tai ru -- no -- jās.
}



fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
\lyricsto "voiceA" \new Lyrics \lyricC
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



