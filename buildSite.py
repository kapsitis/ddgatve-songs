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
    copyDirectory('markdown/reveal.js', 'target/reveal.js')
    copyDirectory('markdown/svg', 'target/svg')
    shutil.copyfile('markdown/index.html', 'target/index.html')  
    resTypes = ['markdown']
    for resType in resTypes:
        ROOT = resType
        subDirectories = set(next(os.walk(ROOT))[1]).difference(set(['svg', 'reveal.js']))
        for dd in subDirectories:
            print('Processing with pandoc/reveal, dir=%s' % dd)
            srcPath = 'index.md'
            destPath = 'index.html'
            workingDir = '%s/%s' % (ROOT,dd)
            print('workingDir %s' % workingDir)
            subprocess.call(['pandoc','-t','revealjs','-s',
                '-o',destPath,srcPath,'--slide-level=2',
                '-V','revealjs-url=../reveal.js','--metadata', 'pagetitle="Janu dziesmas"',
                '--mathjax=https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML',
                '-V','theme=white'], cwd=workingDir)
            copyDirectory('%s/%s' % (ROOT,dd), 'target/%s' % dd)


if __name__ == '__main__':
    main()




