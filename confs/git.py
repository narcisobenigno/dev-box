import envrepo
import envinfo
import subprocess

print 'Setting up git..'

envrepo.install_missing('git')
envrepo.confln('git')

subprocess.Popen(
    "ln -si {} {}".format(
        envinfo.home('.git/gitconfig'),
        envinfo.home('.gitconfig')
        ).split()
    ).communicate()


print 'git has been set up!'
