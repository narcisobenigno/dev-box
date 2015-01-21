from os import path
import glob
import subprocess

import envinfo

def confln(confname):
    if not path.exists(confhome(confname)):
        os.symlink(confsource(confname), confhome(confname))

def dotfileln(installation, confname):
    subprocess.Popen(
            "ln -si {} {}".format(
                confhome(installation) + '/' + confname,
                envinfo.home(dot(confname))
                ).split()
            ).communicate()

def confsource(confname):
    return envinfo.source(confname)

def confhome(confname):
    return envinfo.home(dot(confname))

def dot(file):
    return '.' + file

def brew(command):
    return subprocess.check_output(("brew " + command).split())

def install_missing(dep, *params):
    installed = brew("ls --versions " + dep)
    if not installed:
        print "Installing " + dep
        brew("install {} {}".format(dep, " ".join(params)))

def confs():
    return glob.glob(envinfo.source("confs/*.py"))
