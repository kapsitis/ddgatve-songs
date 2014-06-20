\version "2.13.16" 
%\header {
% title = "Apkārt kalnu gāju"
%}
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
g'8 g ees' ees | d4 bes | c8 c ees d16[ c] | bes8[ a] g4 |
ees'8 ees d16[ c] d8 | c8 c bes16[ a] g8 | bes8 bes a16[ g] c8 | g2 |
ees'8 ees d16[ c] d8 | c8 c bes16[ a] g8 | bes8 bes a16[ g] c8 | g2   
\bar "|."  
}


lyricAA = \lyricmode {
% Es uz -- kā -- pu kal -- nā, pa -- šā kal -- na ga -- lā,
Ap -- kārt kal -- nu gā -- ju, kal -- ni -- ņā uz -- kā -- pu,  
ie -- rau -- dzī -- ju lī -- ga -- vi -- ņu gau -- ži rau -- dā -- jam, 
ie -- rau -- dzī -- ju lī -- ga -- vi -- ņu gau -- ži rau -- dā -- jam.
}

lyricAB = \lyricmode {
Um den Hü -- gel schritt ich, Sehn -- suchts -- schmer -- zen litt ich, 
da er -- blickt' ich mei -- ne Lieb -- ste bit -- ter wein -- te sie, 
da er -- blickt' ich mei -- ne Lieb -- ste bit -- ter wein -- te sie. 
}

chordsA = \chordmode {
g4:m ees4:6 | d4:5 ees4:5 | c4:m fis4:dim | d4:aug g4:m | 
ees4:5 bes4:5 | c4:m g4:m | c4:m7 fis4:dim | c4:m g4:m |  
ees4:5 bes4:5 | c4:m g4:m | c4:m7 fis4:dim | c4:m g4:m |  
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


