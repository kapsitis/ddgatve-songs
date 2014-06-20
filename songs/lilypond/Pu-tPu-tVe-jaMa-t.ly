\version "2.13.16"
%\header {
%    title = "Pūt, pūt Vēja māt",Budēlīši, jūra
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
\key aes \major
\repeat volta 2 {
\time 4/4
c'4 c c8 bes8 bes4 |
c8 bes c bes bes aes aes4 |
}
\repeat volta 2 {
\time 2/4
<<
{ ees8 aes ees8 aes | }
\new Staff \with {
\remove "Time_signature_engraver"
\remove "Bar_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
} { 
  \key aes \major
  \voiceOne \autoBeamOff f8 aes f aes     
}
>>
aes8 g g g |
g8 bes g bes |
bes8 aes aes4 |
}
}

lyricA = \lyricmode {
Pūt, pūt Vē -- ja māt, met jel mie -- ru va -- ka -- rā,
da -- ža la -- ba dvē -- se -- lī -- te uz ū -- de -- ņa lī -- go -- jās.
} 

fullScore = <<
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


