\version "2.13.16"
%\header {
%    title = "Pīmiņ, bruoļ"
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
\key g \major
\time 2/4
\phrasingSlurDashed
g'4. a8 | b2 | d4. c8 | b4. a16\( a\) | g4. a8 | b4. c8 | b8 a g fis | g2 |
\bar "|."
} 

lyricA = \lyricmode {
\set stanza = #"1." Pī -- miņ, bruoļ, pī -- miņ, bruoļ,
So -- vu Tā -- vu ze -- mi– so -- vu Lat -- go -- lu.
}

lyricB = \lyricmode {
\set stanza = #"2." Ce -- līs, bruoļ, ce -- līs, bruoļ,
Myus’ _  Muo -- rys ze -- mē Dī -- vu gū -- dy -- noj.
}

lyricC = \lyricmode {
\set stanza = #"3." Dzī -- di, bruoļ, dzī -- di, bruoļ,
Lai _ tre -- šuo zvaig -- zne ot -- kon spei -- dēt suok.
} 

fullScore = <<
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
\lyricsto "voiceA" \new Lyrics \lyricC
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



