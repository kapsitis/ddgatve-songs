\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Nadūd, Dīvs(i) veitūlam(i)"
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
\key d \minor
\time 6/8
f4 f8 e8[( f]) e | d4 d8 f[( e]) d | cis4 a8 f'4 e8 | d4 d8 d4. |
a'4 a8 g8[( a]) g | f4 f8 a[( g]) f | e4 a,8 f'4 e8 | d4 d8 d4 d8 
\repeat volta 2 {
bes'8 bes bes bes a g | a8 a a a g f | e8 a, a f'4 e8 
}
\alternative { { d4 d8 d4 d8  } { d4 d8 d4. } }
\bar "|."
} 



lyricA = \lyricmode {
Na -- dūd, Dīv -- s(i), vei -- tū -- la -- m(i)
Bol -- tim zī -- dim nū -- zī -- dēt!
Na -- dūd, Dīv -- s(i), dzā -- ruo -- ja -- m(i)
Nū -- jimt mu -- nu vai -- ņu -- ceņ’!
Vys -- skais -- tuo -- kū mei -- ti -- ni jim -- šu pi se -- vi,
I dzei -- vuo -- sim myu -- žu lai -- mei -- gi. 
Vys -- 
lai -- mei -- gi.
}



fullScore = <<
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


