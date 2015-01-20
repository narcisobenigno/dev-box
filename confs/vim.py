import envrepo
import envinfo
import subprocess

print 'Setting up vim...'

envrepo.install_missing('macvim', '--env-std --override-system-vim')
envrepo.install_missing('cabal-install')

envrepo.confln('vim')

subprocess.Popen(
    "ln -si {} {}".format(
        envinfo.home('.vim/vimrc'),
        envinfo.home('.vimrc')
        ).split()
    ).communicate()

subprocess.Popen("vim +PluginInstall +qall".split()).communicate()

subprocess.Popen(
    "make --directory={}".format(
        envinfo.home('.vim/bundle/vimproc.vim/')
        ).split()
    ).communicate()

print 'Vim has been set up!'
