\version "2.13.18"
#(ly:set-option 'crop #t)

\paper {
line-width = 14\cm
left-margin = 0.4\cm
between-system-padding = 0.1\cm
between-system-space = 0.1\cm
}
% Ņem, Jānīti, melnu zirgu; "3x9 jāņi; p.44" 
\layout {
indent = #0
ragged-last = ##f
}


voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
d'8. a16 d8 d | d8 b a d | c4 b | c8[ d] d4 | 
d8. a16 d8 d | d8 b a d | c4 b | c8[ d] d4 |
d8. a16 d8 d | d8 b a d | c4 b\fermata |
\bar"|."
}

lyricA = \lyricmode {
Ņem, Jā -- nī -- ti, mel -- nu zir -- gu, lī -- go, lī -- go, 
Ap -- jāj sa -- vus tī -- ru -- mi -- ņus, lī -- go, lī -- go!
Ap -- jāj sa -- vus tī -- ru -- mi -- ņus, lī -- go, lī -- go!
}


fullScore = <<
%\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA"  \lyricA
%\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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


