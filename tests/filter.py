import os
import re

def findfiles(path, regex):
    regObj = re.compile(regex)
    res = []
    for root, dirs, fnames in os.walk(path):
        for fname in fnames:
            if fname.endswith('.ly'):
                #print('Searching {}'.format(fname))
                filepath = '{}/{}'.format(path, fname)
                with open(filepath, encoding='UTF8') as f:
                    for line in f:
                        if regObj.match(line):
                            searchResult = regObj.search(line)
                            res.append('{}: {}'.format(fname, searchResult.group(0)))
                            break

    return res

def main(): 
    searchExpr = r'c[^a-z]+d[^a-z]+e[^a-z]+f[^a-z]'
    allMatches = findfiles('c:\\Users\\kalvis.apsitis\\workspace\\ddgatve-songs\\songs\\lilypond', searchExpr)
    print('Found {} results'.format(len(allMatches)))
    for aMatch in allMatches:
        print(aMatch)
    
    
if __name__ == '__main__':
    main()
