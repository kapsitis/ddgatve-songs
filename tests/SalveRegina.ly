\version "2.22.2"
%\header {
%    title = "Salve Regina"
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

\include "gregorian.ly"


voiceA = {
  \set Staff.clefPosition = #3
  \set Staff.middleCPosition = #3
%  \override Staff.StaffSymbol #'color = #red
%  \override Staff.LedgerLineSpanner #'color = #red
  \override Score.BarNumber #'transparent = ##t {
  \key c \major {

% Salve Regina, Mater misericordiae
    \[ a\melisma a \flexa g \pes a\melismaEnd  \] 
    \[ d \]
    \finalis
    \[ a\melisma  a \flexa g\melismaEnd \]
    \[ \virga f\melisma \inclinatum e \inclinatum d  e \pes f \pes g \pes f\melismaEnd \]
    \[ e\melisma \flexa d\melismaEnd \]
    \divisioMaior
    \[ c \]
    \[ d \]
    \[ f \]
    \[ g \]
    \[ f \]
    \[ g\melisma \pes a\melismaEnd \]
    \[ d\melisma \pes e \pes f  \inclinatum e \inclinatum d \inclinatum c\melismaEnd \]
    \[ d \]
    \divisioMaxima
% Vita, dulcedo et spes nostra, salve.
    \[ a\melisma a \flexa g \pes a\melismaEnd \]
    \[ d \]
    \divisioMaior
    \[ a\melisma  a \flexa g\melismaEnd \]
    \[ \virga f\melisma \inclinatum e \inclinatum d  e \pes f \pes g \pes f\melismaEnd \]
    \[ e\melisma \flexa d\melismaEnd \]
    \divisioMaior
    \[ c \]
    \[ d \]
    \[ f \]
    \[ g\melisma \flexa f \pes g \pes a\melismaEnd \]
    \divisioMinima
    \[ d\melisma \pes e \pes f  \inclinatum e \inclinatum d \inclinatum c\melismaEnd \]
    \[ d \]
    \divisioMaxima
% Ad te clamamus exsules filii Hevae.
    \[ d\melisma f \pes \deminutum g\melismaEnd \]
    \[ a \]
    \divisioMinima
    \[ g \]
    \[ g\melisma \flexa f  g \pes a\melismaEnd \]
    \[ e \]
    \divisioMaior
    \[ g \]
    \[ f \]
    \[ e\melisma \flexa d \pes g\melismaEnd \]
    \divisioMinima
    \[ c \]
    \[ d \]
    \[ f \]
    \[ \virga e\melisma \inclinatum d \inclinatum c\melismaEnd \]
    \[ d \]
    \divisioMaxima
% Ad te suspiramus, gementes et flentes
    \[ d\melisma f \pes \deminutum g\melismaEnd \]
    \[ a \]
    \divisioMinima
    \[ c' \]
    \[ g \]
    \[ \virga a\melisma \inclinatum g \inclinatum f \inclinatum e g\melismaEnd \]
    \[ a \]
    \divisioMaior
    \[ d \]
    \[ f \]
    \[ g \]
    \[ d \]
    \[ \virga f\melisma \inclinatum e \inclinatum d\melismaEnd \]
    \[ c \]
    \divisioMaior
    \[ d \]
    \[ d\melisma \flexa c \pes f\melismaEnd \]
    \divisioMinima
    \[ \quilisma g\melisma \pes a\melismaEnd \]
    \[ g \]
    \[ f\melisma \flexa e\melismaEnd \]
    \[ f\melisma \pes g\melismaEnd \]
    \[ \virga f\melisma \inclinatum e \inclinatum d \inclinatum c\melismaEnd \]
    \[ d \]
    \divisioMaxima
% Eja ergo advocata nostra, 
    \[ f\melisma \pes \auctum \descendens g\melismaEnd \]
    \[ f \]
    \[ g\melisma \pes \deminutum a\melismaEnd \]
    \[ a \]
    \divisioMaior
    \[ c' \]
    \[ g \]
    \[ \virga a\melisma \inclinatum g \inclinatum f\melismaEnd \]
    \[ e\melisma \flexa d\melismaEnd \]
    \[ g \]
    \[ a \]
    \divisioMinima
% illos tuos misericordes oculos ad nos converte.
    \[ d' \]
    \[ d' \]
    \[ c'\melisma \flexa b c' \pes d' \flexa a\melismaEnd \]
    \[ a \]
    \divisioMaior
    \[ d' \]
    \[ c' \]
    \[ a\melisma \flexa g\melismaEnd \]
    \[ f\melisma  \]
    \[ g \pes a \pes bes \flexa a a \flexa \deminutum g\melismaEnd \]
    \[ a\melisma \flexa g\melismaEnd \]
    \divisioMinima
    \[ d\melisma \pes e\melismaEnd \]
    \[ f \]
    \[ \virga e\melisma \inclinatum d \inclinatum c\melismaEnd \]
    \divisioMaior
    \[ c\melisma \pes d\melismaEnd \]
    \[ f \]
    \[ g\melisma \flexa f g \pes a\melismaEnd \]
    \[ d\melisma  e \pes f \inclinatum e \inclinatum d \inclinatum c\melismaEnd \] 
    \[ d \]
    \divisioMaxima
% Et Jesum benedictum fructum ventris tui
    \[ d \]
    \[ a, \]
    \[ c\melisma \pes d\melismaEnd \]
    \divisioMinima
    \[ c \]
    \[ d\melisma \pes e\melismaEnd \]
    \[ \virga f\melisma \inclinatum e \inclinatum d\melismaEnd \]
    \[ c \]
    \divisioMaior
    \[ g \]
    \[ f\melisma \flexa e\melismaEnd \]
    \[ d \]
    \[ g \]
    \[ \virga f\melisma \inclinatum e \inclinatum d \inclinatum c\melismaEnd \] 
    \[ d \]
    \divisioMaior
% nobis post hoc exsilium ostende
    \[ d\melisma \pes a \virga bes\melismaEnd \]
    \[ a \]
    \divisioMinima
    \[ \virga a\melisma \inclinatum g \inclinatum f\melismaEnd \]
    \[ g \]
    \[ d \]
    \[ f \]
    \[ f\melisma \flexa e\melismaEnd \]
    \[ d\melisma \flexa \auctum \ascendens c\melismaEnd \] 
    \divisioMinima
    \[ e\melisma \pes f \inclinatum d \inclinatum c\melismaEnd \]
    \[ \auctum \ascendens c \] 
    \[ d \]
    \divisioMaxima
% O clemens, o pia
    \[ a\melisma \flexa g \pes a  c' \pes d'\melismaEnd \]
    \divisioMinima
    \[ \virga c'\melisma \inclinatum b \inclinatum a \inclinatum g\melismaEnd \]
    \[ a \]
    \divisioMaxima
    \[ a\melisma \flexa g \pes a  c' \pes d'\melismaEnd \]
    \divisioMinima
    \[ \virga c'\melisma \inclinatum b \inclinatum a \inclinatum g\melismaEnd \]
    \[ a \]
    \divisioMaxima
% O dulcis Virgo Maria.
    \[ a\melisma \flexa g \pes a \flexa d \]
    \divisioMinima
    \[ \virga f \inclinatum e \inclinatum d \inclinatum c \]
    \divisioMaior
    \[ c \pes d e \pes f\melismaEnd \]
    \[ g\melisma \flexa \deminutum f\melismaEnd \] 
    \[ g\melisma \pes a\melismaEnd \]
    \divisioMinima
    \[ d\melisma \flexa \deminutum c\melismaEnd \] 
    \[ c \]
    \[ d \]
    \[ e\melisma \pes f\melismaEnd \]
    \[ e\melisma \flexa d\melismaEnd \]
    \finalis 

  }
  }
}

lyricA = \lyricmode {
Sal -- ve Re -- gi -- na, Ma -- ter mi -- se -- ri -- cor -- di -- ae,
Vi -- ta, dul -- ce -- do et spes nos -- tra, sal -- ve.
Ad te cla -- ma -- mus ex -- su -- les fi -- li -- i He -- vae.
Ad te sus -- pi -- ra -- mus, ge -- men -- tes et flen -- tes 
in hac lac -- ri -- ma -- rum val -- le.
E -- ja er -- go ad -- vo -- ca -- ta nos -- tra,
il -- los  tu -- os mi -- se -- ri -- cor -- des o -- cu -- los ad nos con -- ver -- te.
Et Je -- sum be -- ne -- dic -- tum  fruc -- tum ven -- tris tu -- i
no -- bis post hoc ex -- si -- li -- um o -- sten -- de.
O cle -- mens, o pi -- a,
o dul -- cis Vir -- go Ma -- ri -- a.
}

fullScore = <<
\new VaticanaVoice = "voiceA" { \voiceA }
\new Lyrics \lyricsto "voiceA" { \lyricA }
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


