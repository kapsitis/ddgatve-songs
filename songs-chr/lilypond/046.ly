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
a4. e1:7 s8 a1 s8 e1:7 s8 a2. a4.:7 d2. e4.:7 a2. fis4.:min b2.:min e4.:7 a2. e4. a2.
}

voiceA = \relative c'' {
\clef "treble"
\key a \major
\time 9/8

a8 gis fis a4. gis4 gis8 | gis fis e fis4. e | cis'8 b a b4. b4 b8 | b a b cis4.~ cis4 r8|
\repeat volta 2 {cis8 d cis e4. d4 d8 | b a b d4. cis | a8 gis a b4. fis4 fis8}

\alternative {
	{b8 a b cis4.~ cis4 r8}
	{b8 a gis a2. \bar"|."}
}
}

lyricA = \lyricmode {
\set stanza = #"1. "
Ag -- lo -- nas Diev -- mā -- tes bal -- ta -- jā na -- mā. Pul -- cē -- jas tau -- ta sev svēt -- lai -- mi gūt. At -- da -- rīt sir -- dis un mū -- žī -- gā gais -- mā. Tī -- ri no grē -- kiem un sirds -- dēs -- tiem kļūt. sirds -- dēs -- tiem kļūt.
}
lyricB = \lyricmode {
\set stanza = #"2. "
Iz -- jus -- tās lūg -- ša -- nās, sir -- snī -- gās dzies -- mās. Ie -- tverts ir cil -- vē -- ku lū -- dzo -- šais vaids.
Aiz -- mir -- stot ik -- die -- nas ne -- mie -- ra steig -- smi, rem -- dēts top īg -- nums un ze -- mis -- kais naids. ze -- mis -- kas naids.
}
lyricC = \lyricmode {
\set stanza = #"3. "
Bi -- jī -- bā svē -- tā es no -- lie -- cu gal -- vu. A -- ve Ma -- ri -- a, tad lū -- pas man čukst.
Diev -- mā -- te do -- di kā dār -- gā -- ko bal -- vu. Tev lai ik die -- nas tik sirds ma -- na pukst. sirds ma -- na pukst.
}
lyricD = \lyricmode {
\set stanza = #"4. "
Ko -- pē -- jā lūg -- ša -- nā vie -- no -- jas tau -- ta. Sā -- pes un sirds -- mo -- kas pa -- ma -- zām gaist. Pā -- ri par Lat -- ga -- les e -- ze -- riem, kal -- niem Ag -- lo -- nas Diev -- mā -- tes zelt -- tor -- nis mirdz. zelt -- tro -- nis mirdz.
}

fullScore = <<
\new ChordNames { \chordsA }
\new Staff {
<<
\new Voice = "voiceA" { \oneVoice \autoBeamOff \voiceA }
\lyricsto "voiceA" \new Lyrics \lyricA
\lyricsto "voiceA" \new Lyrics \lyricB
\lyricsto "voiceA" \new Lyrics \lyricC
\lyricsto "voiceA" \new Lyrics \lyricD
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


