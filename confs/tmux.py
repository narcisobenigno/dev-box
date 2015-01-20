import envrepo
import envinfo
import subprocess

print 'Setting up tmux..'

envrepo.install_missing('tmux')
envrepo.install_missing('reattach-to-user-namespace')
envrepo.confln('tmux')

subprocess.Popen(
    "ln -si {} {}".format(
        envinfo.home('.tmux/tmux.conf'),
        envinfo.home('.tmux.conf')
        ).split()
    ).communicate()


print 'tmux has been set up!'
