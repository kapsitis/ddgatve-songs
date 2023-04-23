\version "2.13.18"
#(ly:set-option 'crop #t)

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
\time 2/4
f8^"Veens." d f f | f e d e | g4 e\fermata | f8[( e]) d4\fermata | \break
f'8^"Veena smalki."_"Visi." f f f | f f e d | f4 e | e e | \oneVoice e,8 d e e | \break
e d d e | f4 e | \voiceOne f'8 f f f | f f e d | f4 e\fermata
\bar "|."
}


voiceB = \relative c' {
\clef "treble"
\key c \major
\time 2/4
s2 | s2 | s2 | s2 |
f8 e d d | d d d a | d4 e | e e | s2 |
s2 | s2 | e8 d d d | d d d a | d4 e\fermata
}

lyricAA = \lyricmode {
Ja -- nits se -- dej kal -- ni -- ņa -- i li -- go! li -- go!
Ja -- nits se -- dej kal -- ni -- ņa -- i li -- go! li -- go!
Za -- ļu na -- sta mu -- gu -- ra -- i li -- go!
Za -- ļu na -- sta mu -- gu -- ra -- i li -- go!
}

lyricAB = \lyricmode {
Nac Ja -- ni -- ti le -- ji -- ņa -- i li -- go! li -- go!
Nac Ja -- ni -- ti le -- ji -- ņa -- i li -- go! li -- go!
Dod ma -- na -- mi te -- li -- te -- mi li -- go!
Dod ma -- na -- mi te -- li -- te -- mi li -- go!
}

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \voiceOne \autoBeamOff \voiceA }
\new Voice = "voiceB" { \voiceTwo \autoBeamOff \voiceB }
\new Lyrics \lyricsto "voiceA" \lyricAA
\new Lyrics \lyricsto "voiceA" \lyricAB
>>
}
>>

\score {
\fullScore
\header { piece = "__" opus = "__" }
}
