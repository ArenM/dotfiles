#! /usr/bin/env python2

import subprocess
import re

def enviroment():
    glinfo = subprocess.check_output('glxinfo; exit 0', stderr=subprocess.STDOUT, shell=True)
   
    try:
        maxver = re.findall(r'Max core profile version.*$', glinfo, flags=re.MULTILINE)[0]
        maxver = float(maxver.split(': ')[1])
    except:
        import os
        with open('glinfo.txt','w') as f:
            f.write(glinfo)
        return {'gles3': os.getcwd()}

    versupp = maxver > 3
    
    return {'gles3': versupp}

if __name__ == '__main__':
    print(enviroment())
