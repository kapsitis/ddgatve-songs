import os
import shutil
import subprocess


def copyDirectory(src, dest):
    # print('Trying to copyDirectory %s to %s' % (src, dest))
    try:
        shutil.copytree(src, dest)
    # Directories are the same
    except shutil.Error as e:
        print('Directory not copied. Error: %s' % e)
    # Any error saying that the directory doesn't exist
    except OSError as e:
        print('Directory not copied. Error: %s' % e)

def rmDirectory(src):
    try: 
        shutil.rmtree(src)
    # Directories are the same
    except shutil.Error as e:
        print('Directory not removed. Error: %s' % e)
    # Any error saying that the directory doesn't exist
    except OSError as e:
        print('Directory not removed. Error: %s' % e)

def main(): 
    rmDirectory('target')
    copyDirectory('reveal.js', 'target/reveal.js')
    shutil.copyfile('markdown/index.html', 'target/index.html')  
    resTypes = ['markdown']
    for resType in resTypes:
        rmDirectory('%s/svg' % resType)
        copyDirectory('songs/svg', '%s/svg' % resType)
        ROOT = resType
        subDirectories = set(next(os.walk(ROOT))[1]).difference(set(['svg']))
        for dd in subDirectories:
            print('Processing with pandoc/reveal, dir=%s' % dd)
            srcPath = 'index.md'
            destPath = 'index.html'
            workingDir = '%s/%s' % (ROOT,dd)
            print('workingDir %s' % workingDir)
            subprocess.call(['pandoc','-t','revealjs','-s',
                '-o',destPath,srcPath,'--slide-level=2',
                '-V','revealjs-url=../../reveal.js','--metadata', 'pagetitle="Janu dziesmas"',
                '--mathjax=https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML',
                '-V','theme=white'], cwd=workingDir)
            copyDirectory('%s/%s' % (ROOT,dd), 'target/%s' % dd)
 #           copyDirectory('%s/%s/svg' % (ROOT,dd), 'target/%s/svg' % dd)


if __name__ == '__main__':
    main()




