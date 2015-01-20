from os import path
import glob
import subprocess

import envinfo

def confln(confname):
    source = envinfo.source(confname)
    linkname = envinfo.home("." + confname)

    if not path.exists(linkname):
        os.symlink(source, linkname)

def brew(command):
    return subprocess.check_output(("brew " + command).split())

def install_missing(dep, *params):
    installed = brew("ls --versions " + dep)
    if not installed:
        print "Installing " + dep
        brew("install {} {}".format(dep, " ".join(params)))

def confs():
    return glob.glob(envinfo.source("confs/*.py"))
