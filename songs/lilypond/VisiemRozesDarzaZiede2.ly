\version "2.13.16"
%\header {
% title = "Visiem rozes dārzā ziede"
%}
% Austras dziesmu burtnīca, 33.lpp.
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
\key c \major
\time 3/4 c8 e g[ f] d4 | g,8 d' f[ e] c4 | c8 e g g c16[ b] a8 
\time 2/4 g4. f8 
\time 3/4 e8 c c4. e8 | f8 e g4 d | g,8 b d e f e | c2 r4
\bar "|."
}



lyricA = \lyricmode {
Vi -- siem ro -- zes dār -- zā zie -- de, ma -- nas ro -- zes ne -- zie -- dē -- ja, 
vi -- siem ro -- zes dār -- zā zie -- de, ma -- nas ro -- zes ne -- zie -- dēj.
}

chordsA = \chordmode {
\time 3/4 c4:5 g2:5 | g2:7 c4:5 | s2 f4:5 
\time 2/4 g2:7 
\time 3/4 c2.:5 | s4 g2:5 | s2 f4:5 | c2:5 s4 
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


