\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Čigi, čigi, čigāniņi"
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
\key bes \major
\time 6/8
\repeat volta 2 {
%MS
f8 g f f d d | f4 ees8 d16[ ees] f4
%ME
}
\repeat volta 2 {
f8 g( f) f d4 | f8 f ees d16[ ees] f4  
}
\time 2/4
\repeat volta 2 {
f16 f f f g f f f | d16 ees f8 d16 ees f8
} 
\repeat volta 2 {
f16 f f f g f f f | d16 ees f8 d16 ees f8
} 
} 

lyricA = \lyricmode {
Pus -- ga -- du gu -- lē -- ju aiz -- krās -- nē -- i. Nu mans va -- kars, nu nā -- cu ā -- rā.
Či -- gi, či -- gi či -- gā -- ni -- ņi, ka -- le -- dō, ka -- le -- dō, 
Šī die -- ni -- ņa, šī nak -- sni -- ņa ka -- le -- dō, ka -- le -- dō, 
}

lyricB = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
vie -- nu vie -- tu, vie -- nu vie -- tu, ka -- le -- dō, ka -- le -- dō. 
e -- ja -- mā -- i,  le -- cā -- mā -- i, ka -- le -- dō, ka -- le -- dō.
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Lyrics \lyricsto "voiceA" \lyricB
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



