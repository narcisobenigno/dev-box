import envrepo
import subprocess

class Installation:
    def install(self, name, config, pre_reqs, post_commands = []):
        print 'Setting up {}...'.format(name)

        self.__pre_reqs(pre_reqs)
        envrepo.confln(name)
        envrepo.dotfileln(name, config)
        self.__post_commands(post_commands)

        print "{} has been set up!".format(name)


    def __post_commands(self, commands):
        for command in commands:
            subprocess.Popen(command.split()).communicate()

    def __pre_reqs(self, reqs):
        for req in reqs:
            envrepo.install_missing(*req)
