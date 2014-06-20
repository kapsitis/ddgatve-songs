\version "2.13.16" 
%\header {
% title = "Apkārt kalnu gāju"
%}
% J.Vītola t.dz. ar klavieru pavadījumu
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
\key g \minor
\time 2/4
g'8\fermata bes a g | d4 d | g8\fermata bes a g | d'4 d 
\repeat volta 2 {
f8 d c ees | d8 bes a g | bes8 d c a | g2 
}
}


lyricAA = \lyricmode {
Ap -- kārt kal -- nu gā -- ju, kal -- ni -- ņā uz -- kā -- pu, 
ie -- rau -- dzī -- ju lī -- ga -- vi -- ņu gau -- ži rau -- dā -- jot. 
}

lyricAB = \lyricmode {
Um den Hü -- gel schritt ich, Sehn -- suchts -- schmer -- zen litt ich, 
da er -- blickt' ich mei -- ne Lieb -- ste bit -- ter wein -- te sie.  
}

chordsA = \chordmode {
g2:m5 | g4:m5 d4:5 | g4:m5 a4:m7 | g4:m5 d4:5 
\repeat volta 2 { 
bes4:5 f4:7 | bes4:5 a4:m7 | g4:m5 f4:5 | g2:m5 
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


