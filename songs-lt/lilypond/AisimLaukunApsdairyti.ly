\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Aisim laukun apsdairyti"
%}
% "Skamba, skamba kankliai, 1993"
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
\key c \major
\time 3/4
<< { g'8 b d4( c8) d8 }
\new Staff \with {
\remove "Time_signature_engraver"
alignAboveContext = #"main"
fontSize = #-3
\override StaffSymbol #'staff-space = #(magstep -3)
\override StaffSymbol #'thickness = #(magstep -3)
}
{ \autoBeamOff \voiceOne g,8 b d8.^\fermata[( b16 c8]) d8 }
>>
e8 e e4( f8) e
\time 2/4 d4 e | d8 d c c | d4( e8) e | d8[( g]) e4 | d8 d c c | d2
\bar "|."
}

lyricA = \lyricmode {
Ai -- sim lau -- kun aps -- dai -- ry -- ti, ža -- lia še -- ne -- lia var -- ty -- ti,
ža -- lia še -- ne -- lia var -- ty(ti).
}

voiceB = \relative c' {
\clef "treble"
\key c \major
\time 3/4 g'8 g g4. g8 | \slurDown c8 c c4( d8) c8
\time 2/4 <<g4 b4>> c4 | b8 b a a | g4( c8) c | <<g4 b4>> c4 | b8 b a a | g2
\bar "|."
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Lyrics \lyricsto "voiceA" \lyricA
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
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
