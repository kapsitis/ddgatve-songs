\version "2.13.18"
#(ly:set-option 'crop #t)

%\header {
%    title = "Iebrauca saulīte ābeļu dārzā"
%}
% F/g "Laiva", rokraksts - dzeltena_mape.pdf, p.22
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
\time 3/8
\clef "treble"
\key c \major
\override Voice.TextScript #'font-family = #'sans
\override Voice.TextScript #'font-size = #-1

e8^"do" f^\markup{\center-column{ x 3p. }} e^"do" | 
e8^"do" d^\markup{\center-column{x 4p.}} c^"do" | 
e8^"do" f^\markup{\center-column{x 3p.}} e^"do" | 
e16[ d]^\markup{\right-column{x "do 4p."}} d4^\markup{\underline "re"} \break

d8^"re" f^"re" e^\markup{\center-column{x 3p.}} | 
f8^"re" e^\markup{\center-column{x 3p.}} d16[ c]^\markup{\right-column{x "re 4p."}} | 
e8^"do" f^\markup{\center-column{xv? 3p.}} e^"do" | 
e4.^\markup{\underline "do"} 
\bar "|."
}



lyricA = \lyricmode {
Ie -- brau -- ca Sau -- lī -- te ā -- be -- ļu dār -- zā, 
Ie -- brau -- ca Sau -- lī -- te ā -- be -- ļu dārz'.
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


