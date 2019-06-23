import os
import shutil
import subprocess
import re

dziesmas = [
'AiJanitiDievaDels',
'AiJa-ni-tiDievaDe-lsi',
'AiJusPuisiAiJusMeitas',
'AiSauli-teMe-nestinjiKa-Ju-sSkaistiMijaties2',
'AizejLietin-Ru-kdamsKaukdams',
'Avota-iGuniKu-ru',
'CeliesiBralitiAuniesiKajas',
'DievinsBridaRudzuLauku',
'DindaruDandaruOzolini',
'EsJumsSakuJanaBerni',
'EsRedzejuJanuNakti',
'Ga-juGa-juGaruCel-u',
'G-e-rbiesSauleSudrabota',
'IebraucaSauliteAbeluDarza2',
'Ja-n-aBe-rniSana-kus-i',
'Ja-n-aMa-tesPagalma-i',
'JanisamiPavaicaju',
'JanisamiTrejiVarti',
'Ja-ni-tsBraucaKatruGad',
'JanitsJanuVakara',
'Ja-ni-tsSavuKumelin-u',
'Ja-ni-tsSe-deOzola-je',
'JauJa-ni-tisAizvakar',
'Ju-sMa-sin-asNezina-ti',
'KasSpidejaKasVizeja',
'KasToTeicaTasMeloja',
'KasTurSpi-daKasTurMirdza',
'LabvakariJanaMate',
'LabvakarRudzuLauks',
'LaiBijVardiKamBijVardi',
'LielaisJanisKalnina',
'Li-goJa-ni-ti',
'LigojatiLigojati',
'LigoLaukiLigoPlavas',
'NacNakdamaJanuDiena',
'NedodDievisManBe-din-u',
'NeguluNeguluJanisaNakti',
'NelistLietusNelistLietus',
'N-emJa-ni-tiBaltuZirgu',
'N-emJa-ni-tiMelnuZirgu',
'OzoliniOzolini',
'Para-diesTuSauli-te',
'PaGadska-rtuJa-ni-tsNa-ca',
'Perkonitis',
'PinuPinuSietu',
'Ra-miRa-miJa-ni-tsBrauca',
'RitiSauli-tRite-dama',
'Saku-rosiUguntin-u',
'Samaisi-juIemauktin-us',
'SanacietiJanaBerni',
'SauleBraucaPa-rDebesi',
'SauleBridaMiglajosi',
'SauleDevaSavMeitin-u',
'SauleMeituIzdevusi',
'SitJanitiVaraBungas',
'SkersuDienuSauleTeka',
'Spi-gul-oSauli-t',
'SudrabotiGailiDzied2',
'SurpJanaBerni',
'Ta-Saci-jaTa-BijTiesa',
'TekuTekuPaCelin-u',
'TiesaTiesaNeMelini',
'Tri-sKalnin-iNoziede-ja',
'TumsaTumsaKasParTumsu',
'TuratiesiTuratiesi',
'VienaPatiJanuZale',
'VijDievin-iZeltaViju',
'VisiMez-iGuniDega',
'VisuDienuLietin-s-Lija',
'Zal-aZal-aSkal-aSkal-a'
]




thisDict = {
  "../../songs/lilypond/AizejLietin-Ru-kdamsKaukdams.ly": "*UDDUUDDRRUDDUUDDRRUDDUUDDUD",
  "../../songs/lilypond/DindaruDandaruOzolini.ly": "*RRRRRRRUDRRRRRRRRRR",
  "../../songs/lilypond/IebraucaSauliteAbeluDarza2.ly": "*UDRDDUUDRDRRUDUDDDUUDR",
  "../../songs/lilypond/Ja-n-aBe-rniSana-kus-i.ly":"*RRDDRRUUDURRDDRRUUD",
  "../../songs/lilypond/KasTurSpi-daKasTurMirdza.ly": "*URDUDDDRURDUDDDUUDDUDUUD", 
  "../../songs/lilypond/Perkonitis.ly": "*RURDRRRDDRRURRRRURDRRRDDRRURR", 
  "../../songs/lilypond/Spi-gul-oSauli-t.ly": "*DRRRUDRUDRUDRRRUDRUDR"
}

ddKeys = set([4,8,13,14,26,43,56])

def main(): 
    #offset = 0
    mincodelen = 100
    mincodesample = ''
    for i in range(0 ,len(dziesmas)): 
        path = '../../songs/lilypond/%s.ly' % dziesmas[i]
        if i in ddKeys:
            theCode = thisDict[path]
            print('%s,%s' % (dziesmas[i], theCode))
        else:
            #print('%s,***' % dziesmas[i])
            ## print('path = %s' % path)
            with open(path, 'r') as file:
                data = file.read().replace('\n', ' ')
                data1 = re.sub('\\\\transpose\s*[a-gs\']+\s*[a-gs\']+\s*\{ ','',data)
                data1 = re.sub('\\\\repeat\s*volta\s*2\s*\{','',data1)
                data1 = re.sub('<<\s*\{','',data1)
                data1 = re.sub('<<d4\s*f>>','d4',data1)
                data1 = re.sub('\\\\(slurDashed|voiceOne|oneVoice)','',data1)
                data1 = re.sub('\\\\clef\s*"treble"','',data1)
                data1 = re.sub('\\\\key\s*[a-gs]+\s*\\\\(minor|major)','',data1)
                data1 = re.sub('\\\\time\s*[0-9]+/[0-9]+','',data1) 
                data1 = re.sub('\\\\bar\s*"\|\.\"','',data1)
                data1 = re.sub('\^"[^"]+"','',data1)
                data1 = re.sub('\\\\fermata','',data1)
                data1 = re.sub('\|','',data1)
                data1 = re.sub('[0-9]+\.?','',data1)
                data1 = re.sub('\s+',' ',data1)
                data1 = re.sub('c\( c\)','c',data1)
                data1 = re.sub('d\( d\)','d',data1)
                data1 = re.sub('e\( e\)','e',data1)
                data1 = re.sub('(\\\\)?[\(\)]','',data1)
                data1 = re.sub('[\[\]]','',data1)

                x = re.search(r'voiceA\s*=\s*\\relative\s*[c\']+\s*\{(\s*.+?)\}', data1)
                notes = x.group(1).strip()
                notesL = notes.split(" ")
                if len(notesL) < mincodelen: 
                    mincodelen = len(notesL)
                    mincodesample = dziesmas[i]
                print("%s,%s" % (dziesmas[i], notesL))
    print('mincodelen = %d, sample = %s' % (mincodelen, mincodesample))
                


if __name__ == '__main__':
    main()




