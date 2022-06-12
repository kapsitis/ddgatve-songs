\version "2.13.18"
#(ly:set-option 'crop #t)
 
%\header {
% title = "Apkārt kalnu gāju"
%}
% Vītols, 100 latviešu tautas dziesmas
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
\key d \minor
\time 2/4
d8 e f g | a4 c8[ a] | d8 d d16[ c] b[ a] | g4 c8[ b] |
a8. bes16 a8 g | f8 a d, e | f8 f e e | d2 |
a'8. bes16 a8 g | f8 a d, e | f8 f e e | d2
\bar "|."  
}


lyricAA = \lyricmode {
Ap -- kārt kal -- nu gā -- ju, kal -- ni -- ņā uz -- kā -- pu, 
ie -- rau -- dzī -- ju lī -- ga -- vi -- ņu gau -- ži rau -- dā -- jot,
ie -- rau -- dzī -- ju lī -- ga -- vi -- ņu gau -- ži rau -- dā -- jot. 
}

lyricAB = \lyricmode {
Um den Hü -- gel schritt ich, Sehn -- suchts -- schmer -- zen litt ich, 
da er -- blickt' ich mei -- ne Lieb -- ste bit -- ter wein -- te sie, 
da er -- blickt' ich mei -- ne Lieb -- ste bit -- ter wein -- te sie. 
}

chordsA = \chordmode {
d2:m | a2:m | d4.:m g8:7 | e4:m c4:5 | f4:5 a4:7 | d2:m |
d4:m cis4:dim | bes2:5 | d4:m a4:7 | d4:m e4:m | d4:m a4:7 | d2:m
}



fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricAA
\new Lyrics \lyricsto "voiceA" \lyricAB
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


