import os

def home(path = ""):
    return "{}/{}".format(os.environ['HOME'], path)

def source(path = ""):
    return home("Dropbox/dev-box/" + path)
