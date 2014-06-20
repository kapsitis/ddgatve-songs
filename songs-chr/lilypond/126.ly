\version "2.13.18"

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

chordsA = \chordmode {
e2:min b:min e:min b:min e:min b:min e:min d g a:min ais:0 b:7 e:min g b:sus4 b
b:min e:min a:min7 d:7 g e:min b4:min c d2:sus4 d a:min d4 b:min e2:min c a:min7 b1:sus4
}

voiceA = \relative c' {
\clef "treble"
\key g \major
\time 2/4
g'4 fis8 e | fis fis b a | g4 fis8 e | fis4 b,8 r8 | g'4 fis8 e | fis fis b a | g4 fis8 g | a4 d,8 r8 |
b'8 b b d | c b a g | g2 | fis | e8 fis g a | b b b a | b2 | b \bar"||" \break
b8 c b a | g4. g8 | a4 fis8 e | e4 d | d e8 fis | g g b g | d'4 c8 b | a2 |
r4 a8 b | c4 a8 a | d8 c b a | g2 | r8 e fis g | a fis g a | c2 | b \bar"|."
}




lyricA = \lyricmode {
Dievs, mū -- su Tēvs, dod vi -- siem, kas lūdz no Te -- vis! 
Dievs, mū -- su Tēvs, ļauj at -- rast vi -- siem, kas mek -- lē!
At -- ver sa -- vu sir -- di tiem, kas klau -- vē, 
un dod sa -- viem bēr -- niem Svē -- to Ga -- ru.
Ie -- lej mū -- sos Svē -- to Gud -- rī -- bas Ga -- ru, lai mū -- su lūg -- ša -- na spēj sirds il -- gas dzēst, 
lai redz prāts, ko Tu vē -- lies no mums, Tēvs. Tavs Gars mums rā -- dīs īs -- to ce -- ļu.
}


lyricB = \lyricmode {
_ _ _ _ _ _ _ _ _ _ _ _ 
_ _ _ _ _ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _ _ _ 
_ _ _ _ _ _ _ _ _ _
Ie -- lej mū -- sos svē -- tās De -- rī -- bas Ga -- ru, lai mū -- su lūg -- ša -- na spēj pa -- gāt -- ni dzēst, 
lai mēs rau -- gā -- mies Ta -- vām a -- cīm, Tēvs. Un ie -- pa -- zīs -- tam jau -- nu dzī -- vi.
}


fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
>>
}
>>




\score {
\fullScore
\header { piece = "__" opus = "__" }
}
\markup { \with-color #(x11-color 'white) \sans \smaller "aaa" }
\score {
\unfoldRepeats
\fullScore
\midi {
\context { \Staff \remove "Staff_performer" }
\context { \Voice \consists "Staff_performer" }
}
}


