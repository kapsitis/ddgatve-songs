# The following code will search 'MM/DD/YYYY' (e.g. 11/30/2016 or NOV/30/2016, etc ),
# and replace with 'MM-DD-YYYY' in multi-line mode.
import re
import os

for files in os.listdir("."):
    if files.endswith(".ly"):
    #if files == 'A-ApapaVelcPeli-teSalduMiegu.ly':
        print(files)


        with open (files, 'r', encoding='utf-8') as f:
            content = f.read()
            # content_new = re.sub(r'\\lyricsto\s+"voiceA"\s+\\new\s+Lyrics', 
            #    r'\\new Lyrics \\lyricsto "voiceA"', content, flags = re.M)
            # content_new = re.sub(r'\\lyricsto\s+"voiceB"\s+\\new\s+Lyrics', 
            #    r'\\new Lyrics \\lyricsto "voiceB"', content_new, flags = re.M)
            #content_new = re.sub(r'\\version "2\.13\.18"\n', 
            #    r'\\version "2.13.18"\n#(ly:set-option \'crop #t)', content, flags = re.M)
            
            content_new = re.sub(r"#\(ly:set-option \\'crop #t\)", 
                r"#(ly:set-option 'crop #t)", content, flags = re.M)

    
        with open (files, 'w', encoding='utf-8') as fout:
            fout.write(content_new)
            fout.close
