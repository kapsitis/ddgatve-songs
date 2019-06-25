import os
import re
import shutil
import subprocess


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
  "../../../songs/lilypond/AizejLietin-Ru-kdamsKaukdams.ly": "*UDDUUDDRRUDDUUDDRRUDDUUDDUD",
  "../../../songs/lilypond/DindaruDandaruOzolini.ly": "*RRRRRRRUDRRRRRRRRRR",
  "../../../songs/lilypond/IebraucaSauliteAbeluDarza2.ly": "*UDRDDUUDRDRRUDUDDDUUDR",
  "../../../songs/lilypond/Ja-n-aBe-rniSana-kus-i.ly":"*RRDDRRUUDURRDDRRUUD",
  "../../../songs/lilypond/KasTurSpi-daKasTurMirdza.ly": "*URDUDDDRURDUDDDUUDDUDUUD", 
  "../../../songs/lilypond/NelistLietusNelistLietus.ly": "*DDUUDDUUDUDDUDDURRDRDUD",
  "../../../songs/lilypond/Perkonitis.ly": "*RURDRRRDDRRURRRRURDRRRDDRRURR", 
  "../../../songs/lilypond/Spi-gul-oSauli-t.ly": "*DRRRUDRUDRUDRRRUDRUDR"
}

ddKeys = set([4,8,13,14,26,37,43,56])

noAccHeights = {
    'a': 0,
    'b': 1,
    'c': 2,
    'd': 3,
    'e': 4,
    'f': 5,
    'g': 6
}


## Return 1, if two letters indicate that melody goes up; -1, if down, 0, if equal
def letter_up(a,b):
    num_a = noAccHeights[a]
    num_b = noAccHeights[b]
    diff = (num_b - num_a) % 7
    if (diff == 0): 
        return 0
    elif (diff <= 3):
        return 1
    else: 
        return -1

def code_up(aaa,bbb):
    up = letter_up(aaa[0],bbb[0])
    if bbb[len(bbb)-1] == ',':
        return -1
    elif bbb[len(bbb)-1] == '\'':
        return 1
    elif up != 0:
        return up
    elif aaa == bbb: 
        return 0
    elif len(aaa) == len(bbb)+1 and aaa.startswith(bbb):
        return 0
    else: 
        print('Something strange (%s,%s)' % (aaa,bbb))
        return 0

def get_code(lst):
    result = ['*']
    for i in range(1,len(lst)):
        prev = lst[i-1]
        curr = lst[i]
        up = code_up(prev,curr)
        #print("(%s,%s,%s)" % (prev,curr, up))
        if up == 1:
            result.append('U')
        elif up == -1:
            result.append('D')
        else:
            result.append('R')      
    return ''.join(result)


def remove_rests(lst):
    while 'r' in lst:
        lst.remove('r')
        #print('Removed rest')
    while 's' in lst:
        lst.remove('s')
    return lst

def main(): 
    #offset = 0
    mincodelen = 100
    mincodesample = ''
    for i in range(0 ,len(dziesmas)): 
        path = '../../../songs/lilypond/%s.ly' % dziesmas[i]
        if i in ddKeys:
            theCode = thisDict[path]
            print('%s,%s' % (dziesmas[i], theCode[0:13]))
        else:
            with open(path, 'r') as file:
                data = file.read().replace('\n', ' ')
                data1 = re.sub('\\\\transpose\s*[a-gs\']+\s*[a-gs\']+\s*\{ ','',data)
                data1 = re.sub('\\\\repeat\s*volta\s*2\s*\{','',data1)
                data1 = re.sub('<<\s*\{','',data1)
                data1 = re.sub('<<d4\s*f>>','d4',data1)
                data1 = re.sub('\\\\(slurDashed|voiceOne|oneVoice|slurDown)','',data1)
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
                notesL = remove_rests(notesL)
                if len(notesL) < mincodelen: 
                    mincodelen = len(notesL)
                    mincodesample = dziesmas[i]
                p_code = get_code(notesL)
                print('%s,%s' % (dziesmas[i], p_code[0:13]))
                #print('%s,%s' % (dziesmas[i], notesL))
    print('mincodelen = %d, sample = %s' % (mincodelen, mincodesample))
                


if __name__ == '__main__':
    main()



