#! /usr/bin/env python2

import subprocess
import re

def enviroment():
    glinfo = subprocess.check_output('glxinfo')
   
    maxver = re.findall(r'Max core profile version.*$', glinfo, flags=re.MULTILINE)[0]
    maxver = float(maxver.split(': ')[1])

    versupp = maxver > 3
    
    return {'gles3': versupp}

if __name__ == '__main__':
    print(enviroment())
